import 'package:kmphitech/constants.dart';

void addRouteString() => addData(
      path: "$routesDirPath/app_routes.dart",
      content: '''
// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const LOGIN = _Paths.LOGIN;
  static const FORGET_PASS = _Paths.FORGET_PASS;
  static const OTP_SCREEN = _Paths.OTP_SCREEN;
  static const PASSWORD = _Paths.PASSWORD;
  static const REGISTER = _Paths.REGISTER;
  static const SETTING_SCREEN = _Paths.SETTING_SCREEN;
  static const EDIT_PROFILE = _Paths.EDIT_PROFILE;
  static const ABOUTUS_SCREEN = _Paths.ABOUTUS_SCREEN;
  static const CONTACTUS_SCREEN = _Paths.CONTACTUS_SCREEN;
  static const PRIVACY_SCREEN = _Paths.PRIVACY_SCREEN;
  static const TERM_CONDITIONS_SCREEN = _Paths.TERM_CONDITIONS_SCREEN;
  static const DELETE_ACC_SCREEN = _Paths.DELETE_ACC_SCREEN;
  static const DELETE_ACC_REASON_SCREEN = _Paths.DELETE_ACC_REASON_SCREEN;
  static const CHANGE_PASS_SCREEN = _Paths.CHANGE_PASS_SCREEN;
  static const NOTIFICATION_SCREEN = _Paths.NOTIFICATION_SCREEN;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH = '/splash';
  static const LOGIN = '/login';
  static const FORGET_PASS = '/forget-pass';
  static const OTP_SCREEN = '/otp-screen';
  static const PASSWORD = '/password';
  static const REGISTER = '/register';
  static const SETTING_SCREEN = '/setting-screen';
  static const EDIT_PROFILE = '/edit-profile';
  static const ABOUTUS_SCREEN = '/aboutus-screen';
  static const CONTACTUS_SCREEN = '/contactus-screen';
  static const PRIVACY_SCREEN = '/privacy-screen';
  static const TERM_CONDITIONS_SCREEN = '/term-conditions-screen';
  static const DELETE_ACC_SCREEN = '/delete-acc-screen';
  static const DELETE_ACC_REASON_SCREEN = '/delete-acc-reason-screen';
  static const CHANGE_PASS_SCREEN = '/change-pass-screen';
  static const NOTIFICATION_SCREEN = '/notification-screen';
}

''',
    );
