import 'package:kmphitech/constants.dart';

void addLoader() => addData(
      path: "$apiRepoPath/loading.dart",
      content: '''
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../utils/app_colours.dart';

class Loading {
  Loading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..contentPadding = const EdgeInsets.all(18)
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 50.04
      ..lineWidth = 2
      ..radius = 15
      ..progressColor = AppColors.primaryColor
      ..backgroundColor = AppColors.backGroundGrey
      ..indicatorColor = AppColors.primaryColor
      ..textColor = Colors.white
      ..maskColor = Colors.transparent
      ..maskType = EasyLoadingMaskType.custom
      ..userInteractions = true
      ..dismissOnTap = false;
  }

  static void show([String? text]) {
    EasyLoading.instance.userInteractions = false;
    EasyLoading.show(status: text);
  }

  static void toast(String text) {
    EasyLoading.showToast(text);
  }

  static void dismiss() {
    EasyLoading.instance.userInteractions = true;
    EasyLoading.dismiss();
  }
}

''',
    );
