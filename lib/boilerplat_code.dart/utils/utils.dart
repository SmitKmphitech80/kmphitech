import 'package:kmphitech/constants.dart';

void addUtils() => addData(
      path: "$utilsPath/utils.dart",
      content: '''
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/app/utils/app_colour.dart';

/// utils class instance
Utils utils = Utils();

class Utils {
  static void darkStatusBar({Color? navColor}) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness:
            navColor != null ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: navColor ?? Colors.white,
        systemNavigationBarIconBrightness:
            navColor != null ? Brightness.light : Brightness.dark,
        systemNavigationBarDividerColor: navColor ?? Colors.white,
      ),
    );
  }

  static void lightStatusBar({bool isWhiteStatus = false}) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            isWhiteStatus ? Brightness.light : Brightness.dark,
        statusBarBrightness: isWhiteStatus ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  /// <<< To choose screens portrait --------- >>>
  static void screenPortrait() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  /// <<< To check data, string, list, object are empty or not --------- >>>
  bool isValidationEmpty(String? val) {
    if (val == null ||
        val.isEmpty ||
        val == "null" ||
        val == "" ||
        val == "NULL") {
      return true;
    } else {
      return false;
    }
  }

  /// <<< To get device type --------- >>>
  String getDeviceType() {
    if (Platform.isAndroid) {
      return "android";
    } else {
      return "iOS";
    }
  }

  /// <<< hide keyboard --------- >>>
  void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  /// <<< To check email valid or not --------- >>>
  bool emailValidator(String email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))\$';
    RegExp regExp = RegExp(p);
    if (regExp.hasMatch(email)) {
      return true;
    }
    return false;
  }

  /// <<< To check phone valid or not --------- >>>
  bool phoneValidator(String contact) {
    String p = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*\$';
    RegExp regExp = RegExp(p);
    if (regExp.hasMatch(contact)) {
      return true;
    }
    return false;
  }

  /// <<< To check password valid or not --------- >>>
  bool passwordValidator(String contact) {
    String p = r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}\$";
    RegExp regExp = RegExp(p);
    if (regExp.hasMatch(contact)) {
      return true;
    }
    return false;
  }
}
''',
    );
