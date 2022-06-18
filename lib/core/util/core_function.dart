import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:tripkuy/core/app/app.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nav_router/nav_router.dart';

import 'core_variable.dart';
import 'debouncer.dart';

class CoreFunction {
  static final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk

  static Debouncer debouncer = Debouncer(delay: const Duration(seconds: 1));

  static void logPrint(String tag, dynamic log) {
    if (CoreVariable.debug) {
      pattern
          .allMatches(tag + " => " + log.toString())
          .forEach((match) => debugPrint(match.group(0)));
    }
  }

  static String moneyFormatter(dynamic value) {
    double price = double.tryParse(value.toString()) ?? 0;
    var idr =
    NumberFormat.currency(locale: "id_ID", decimalDigits: 0, symbol: "Rp");
    return idr.format(price);
  }

  static showToast(String message, {int duration = 3, int position = 1, Color backgroundColor = ColorPalette.red}) {
    Flushbar(
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      duration: Duration(seconds: duration),
      backgroundColor: backgroundColor,
      icon: const Icon(Icons.error_outline, color: ColorPalette.white),
      // message: message,
      messageText: Text(
        message,
        style: const TextStyle(
          color: ColorPalette.white,
        ),
        maxLines: 3,
      ),
    ).show(navGK.currentContext!);
  }

  static Future<PermissionStatus> _getPermission(Permission permission) async {
    PermissionStatus permissionStatus = await permission.status;
    if (!permissionStatus.isGranted) {
      final status = await permission.request();
      permissionStatus = status;
    }
    if (permissionStatus.isPermanentlyDenied) {
      openAppSettings();
    }
    return permissionStatus;
  }

  static String validatePhoneNumber(String phoneNumberUnvalidate) {
    String? phoneNumber;
    if (phoneNumberUnvalidate.substring(0, 2) == '08') {
      phoneNumber = phoneNumberUnvalidate;
    } else if (phoneNumberUnvalidate.substring(0, 2) == '62') {
      phoneNumber = '0${phoneNumberUnvalidate.substring(2)}';
    } else if (phoneNumberUnvalidate.substring(0, 3) == '+62') {
      phoneNumber = '0${phoneNumberUnvalidate.substring(3)}';
    } else if (phoneNumberUnvalidate.substring(0, 1) == '8') {
      phoneNumber = '0' + phoneNumberUnvalidate;
    } else {
      phoneNumber = '0' + phoneNumberUnvalidate;
    }

    return phoneNumber;
  }

  static String convertMonthToBahasa(String orderDate) {
    Map<String, String> map = Map.fromIterables(
      CoreVariable.codedMonth,
      CoreVariable.decodedMonth,
    );
    var newDate = map.entries
        .fold(orderDate, (String prev, e) => prev.replaceAll(e.key, e.value));
    return newDate;
  }

  static String constructTime(int seconds) {
    int minute = seconds % 3600 ~/ 60;
    int second = seconds % 60;
    return twoDigitNumber(minute.toString()) + ":" + twoDigitNumber(second.toString());
  }

  static String twoDigitNumber(String twoDigit) {
    return twoDigit.toString().length == 1 ? "0" + twoDigit.toString() : twoDigit.toString();
  }

  static String version() {
    if (Platform.isAndroid) {
      return CoreVariable.appsVersionAndroid;
    } else if (Platform.isIOS) {
      return CoreVariable.appsversionIos;
    } else {
      return "";
    }
  }
}
