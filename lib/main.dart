

import 'package:tripkuy/ui/landing/view/landing_view.dart';
import 'package:tripkuy/ui/splashscreen/view/splashscreen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';

import 'core/app/app.dart';
import 'core/util/util.dart';

Future<void> main() async {
  await init();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle( 
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

Future<void> init() async {
  
  WidgetsFlutterBinding.ensureInitialized();

  //? Set Hive Database
  var appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.initFlutter(appDocumentDirectory.path);
  // Hive.registerAdapter(UserBoxAdapter());
  // Hive.registerAdapter(NotificationBoxAdapter());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    _setupLogging();
    super.initState();
  }

  void _setupLogging() async {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((rec) {
      CoreFunction.logPrint("", '${rec.level.name}: ${rec.time}; ${rec.message}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TripKuy',
      navigatorKey: navGK,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: Constant.poppinsRegular
      ),
      home: const LandingView()
    );
  }
}