import 'package:kmphitech/constants.dart';

void addApiFunction() => addData(
      path: "$apiRepoPath/api_function.dart",
      content: '''
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../helper/helper.dart';
import '../utils/constant.dart';
import 'api_class.dart';

class APIFunction {
  Future<CommonResponse> apiCall({
    required String apiName,
    required BuildContext context,
    FormData? params,
    String? token = "",
    bool isLoading = true,
  }) async {
    if (isLoading) utils.hideKeyboard();

    printAction("params -------->>> \${params!.fields}");
    var response = await HttpUtil(token!, isLoading, context).post(
      apiName,
      data: params,
    );
    return CommonResponse.fromJson(response);
  }
}

// class GetAPIFunction {
//   Future<dynamic> apiCall({
//     required String apiName,
//     required BuildContext context,
//     bool isLoading = true,
//   }) async {
//     var response = await HttpUtil("", isLoading, context).get(
//       apiName,
//     );
//     return response;
//   }
// }
//
// class WithOutFormData {
//   Future<dynamic> apiCall({
//     required String apiName,
//     required BuildContext context,
//     dynamic data,
//     bool isLoading = true,
//   }) async {
//     printAction("apiNameapiNameapiNameapiName");
//     printAction(apiName);
//     printAction(data);
//     var response = await HttpUtil("", isLoading, context).withOutFormData(apiName, data: data);
//     return response;
//   }
// }
''',
    );
