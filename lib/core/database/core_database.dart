import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tripkuy/core/database/utility_box.dart';
import 'package:tripkuy/core/usecase/auth_usecase.dart';
import 'package:tripkuy/core/util/util.dart';

class CoreDatabase {

  static Future<Box<dynamic>> openBoxDatabase(String boxName) async {
    try {
      CoreFunction.logPrint('BoxName', boxName);
      if (Hive.isBoxOpen(boxName)) {
        return Hive.box(boxName);
      } else {
        return await Hive.openBox(
          boxName,
        );
      }
    } on HiveError catch (e) {
      // FirebaseCrashlytics.instance.recordError(e.message, e.stackTrace);
      CoreFunction.logPrint('BoxName', boxName);
      CoreFunction.logPrint('Error Open Database', e.message);
      CoreFunction.logPrint('Error Open Stack', e.stackTrace?.toString());
      try {
        return await fixCorruptDatabase(boxName);
      } on HiveError catch (e) {
        // FirebaseCrashlytics.instance.recordError(e.message, e.stackTrace);
        CoreFunction.logPrint('BoxName', boxName);
        CoreFunction.logPrint('Error Open Database', e.message);
        CoreFunction.logPrint('Error Open Stack', e.stackTrace?.toString());
        // if (boxName == EtekadBox.boxUser) {
        //   logout();
        // }
        return deleteAndOpenBox(boxName);
      }
    }
  }

  static Future<Box<dynamic>> fixCorruptDatabase(
    String _boxName,
  ) async {
    // If we come here, we have probably a Hive box corrupted for some reasons.
    // We found that some null values are added randomly at the begining of the .hive file.
    // This is why the file is considered as corrupted.
    // To fix this we remove these null values.
    final Directory documentDirectory =
        await getApplicationDocumentsDirectory();

    // We get the corrupted box file.
    final boxFile = File('${documentDirectory.path}/$_boxName.hive');

    // We read the corrupted content.
    final corruptedContent = await boxFile.readAsBytes();

    // We remove the null elements symbolyzed by the first sequence of 0 values. (ex: [0, 0, 0, 0, 0, 0, 0, 0, 63, 0, 0, 0, 1, 21, 112, 101, 114, 109, 105, 115, 115, 105, ...])
    final correctedContent = corruptedContent.skipWhile(
      (value) => value == 0,
    );
    // We save the content in the file
    await boxFile.writeAsBytes(correctedContent.toList());
    // We retry to open the box
    return await Hive.openBox(
      _boxName,
    );
  }
  
  static Future<Box<dynamic>> deleteAndOpenBox(String boxName) {
    return Hive.deleteBoxFromDisk(boxName).then((_) async {
      return Hive.openBox(boxName);
    });
  }


  static Future deleteDatabase() async {
    var userBox = await openBoxDatabase(UtilityBox.user);
    var notificationBox = await openBoxDatabase(UtilityBox.notification);
    userBox.clear();
    notificationBox.clear();

    await authUsecase.removeUser();
  }
}