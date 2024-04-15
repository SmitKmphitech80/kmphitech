import 'package:kmphitech/constants.dart';

void addContants() => addData(
      path: "$utilsPath/contants.dart",
      content: '''
// ignore_for_file: constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:package_info/package_info.dart';
import '/app/utils/app_strings.dart';

class Constants {
  static const bool isTestingDeveloperMode = kDebugMode;

  static const String YYYY_MM_DD_HH_MM_SS = 'yyyy-MM-dd hh:mm:ss';
  static const String YYYY_MM_DD_HH_MM_SS_24 = 'yyyy-MM-dd HH:mm:ss';
  static const String HH_MM_A = 'hh:mm a';
  static const String YYYY_MM_DD = 'yyyy-MM-dd';
  static const String DD_MM_YYYY = 'dd-MM-yyyy';

  static const String baseUrl = 'baseurl';
  static const String apiKey = 'apiKey';

  /// apis
  static const String sendOTP = "\${baseUrl}sendOTP";
  static const String login = "\${baseUrl}login";
  static const String register = "\${baseUrl}signUp";
  static const String forgotPassword = "\${baseUrl}forgotPassword";
  static const String verifyOTP = "\${baseUrl}verifyForgotPasswordOTP";
  static const String updatePassword = "\${baseUrl}updatePassword";
  static const String changePass = "\${baseUrl}changePassword";
  static const String updateProfile = "\${baseUrl}updateProfile";
  static const String deleteAccount = "\${baseUrl}deleteAccount";
  static const String logOut = "\${baseUrl}logOut";
  static const String contactUs = "\${baseUrl}contactUs";

  static const privacyPolicyURL = "privacyPolicyURL";
  static const aboutUsURL = "aboutUsURL";
  static const termURL = "termURL";

  static String versionCode = "1";
  static String buildNumber = "";

  static setVersionNumber(PackageInfo packageInfo) {
    versionCode = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
  }
}

''',
    );
