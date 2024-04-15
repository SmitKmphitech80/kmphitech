import 'package:kmphitech/constants.dart';

void addHelper() => addData(
      path: "$helperPath/helper.dart",
      content: '''
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:swift_study/app/utils/app_strings.dart';

/// <<< Action Massage Blue Color --------- >>>
void printAction(String text) {
  if (Platform.isAndroid) {
    '\x1B[94m\$text\x1B[0m'.print;
  } else {
    text.print;
  }
}

/// <<< Cancel Massage Gray Color --------- >>>
void printCancel(String text) {
  if (Platform.isAndroid) {
    '\x1B[96m\$text\x1B[0m'.print;
  } else {
    text.print;
  }
}

/// <<< Error Massage Red color --------- >>>
void printWhite(String text) {
  if (Platform.isAndroid) {
    '\x1B[97m\$text\x1B[0m'.print;
  } else {
    text.print;
  }
}

/// <<< Ok Status Massage Green Color --------- >>>
void printOkStatus(String text) {
  if (Platform.isAndroid) {
    '\x1B[92m\$text\x1B[0m'.print;
  } else {
    text.print;
  }
}

/// <<< Error Massage Red color --------- >>>
void printError(String text) {
  if (Platform.isAndroid) {
    '\x1B[91m\$text\x1B[0m'.print;
  } else {
    text.print;
  }
}

/// <<< Warning Massage Yellow Color --------- >>>
void printWarning(String text) {
  if (Platform.isAndroid) {
    '\x1B[93m\$text\x1B[0m'.print;
  } else {
    text.print;
  }
}

/// <<< To show toast massage  --------- >>>
void showToast({
  required String message,
  int? statusCode = 1,
}) {
  if (statusCode == 1) {
    Get.snackbar(
      "",
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: statusCode == 1 ? const Color(0xFFD55959) : Colors.green,
      titleText: const SizedBox(),
      borderRadius: 10,
      margin: const EdgeInsets.all(12),
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
      isDismissible: true,
      padding: const EdgeInsets.only(bottom: 15, top: 10, left: 15, right: 15),
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeInOut,
    );
  } else {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
      textColor: Colors.white,
      backgroundColor: Colors.green,
      timeInSecForIosWeb: 2,
    );
  }
}

extension Elog on dynamic {
  get print {
    /// 800 is the size of each chunk
    final pattern = RegExp('.{1,800}');
    pattern.allMatches(toString()).forEach(
          (match) => log(
            match.group(0).toString(),
            name: AppStrings.appName,
          ),
        );
  }
}
''',
    );
