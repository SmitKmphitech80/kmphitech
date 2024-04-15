import 'package:kmphitech/constants.dart';

void addApiClass() => addData(
      path: "$apiRepoPath/api_class.dart",
      content: '''
import 'dart:async';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';

import '../helper/helper.dart';
import '../utils/constant.dart';
import 'loading.dart';

class HttpUtil {
  static int responseCode1 = 1;
  static int responseCode2 = 2;
  static int responseCode3 = 3;

  factory HttpUtil(String token, bool isLoading, BuildContext context) =>
      _instance(token, isLoading, context);

  static HttpUtil _instance(token, isLoading, context) =>
      HttpUtil._internal(token: token, isLoading: isLoading, context: context);

  late Dio dio;
  CancelToken cancelToken = CancelToken();
  String apiUrl = Constants.baseUrl;
  BuildContext? context;

  HttpUtil._internal(
      {String? token, bool? isLoading, required BuildContext context}) {
    if (utils.isValidationEmpty(token)) {
      token = getStorageData.readString(getStorageData.token);
    }

    BaseOptions options = BaseOptions(
      baseUrl: apiUrl,
      connectTimeout: const Duration(milliseconds: 20000),
      receiveTimeout: const Duration(milliseconds: 20000),
      headers: {
        'key': Constants.apiKey,
        'devicetype': utils.getDeviceType(),
        'token': token,
        'versioncode': Constants.versionCode,
      },
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );

    dio = Dio(options);
    CookieJar cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));

    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
    ));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (isLoading!) {
          Loading.show();
        }
        return handler.next(options); //continue
      },
      onResponse: (response, handler) {
        if (isLoading!) {
          Loading.dismiss();
        }
        return handler.next(response); // continue
      },
      onError: (DioException e, handler) {
        if (isLoading!) {
          Loading.dismiss();
        }
        onError(createErrorEntity(e), context);
        return handler.next(e); //continue
      },
    ));
  }

// On Error....
  void onError(ErrorEntity eInfo, BuildContext context) {
    printError(
        "error.code -> \${eInfo.code}, error.message -> \${eInfo.message}");
    if (eInfo.message.isNotEmpty) {
      showToast(message: eInfo.message);
    }
  }

  createErrorEntity(DioException error) {
    Loading.dismiss();
    if (utils.isValidationEmpty(error.message)) {
      errorEntity(
          code: 0,
          message: "Your internet is not available, please try again later");
    }

    switch (error.type) {
      case DioExceptionType.cancel:
        errorEntity(code: -1, message: "Request to server was cancelled");
        break;
      case DioExceptionType.connectionTimeout:
        errorEntity(code: -2, message: "Connection timeout with server");
        break;
      case DioExceptionType.sendTimeout:
        errorEntity(
            code: -3, message: "Send timeout in connection with server");
        break;
      case DioExceptionType.receiveTimeout:
        errorEntity(
            code: -4, message: "Receive timeout in connection with server");
        break;
      case DioExceptionType.badResponse:
        {
          try {
            int errCode =
                error.response != null ? error.response!.statusCode! : 00;
            switch (errCode) {
              case 400:
                errorEntity(code: errCode, message: "Request syntax error");
                break;
              case 401:
                errorEntity(code: errCode, message: "Permission denied");
                break;
              case 403:
                errorEntity(
                    code: errCode, message: "Server refuses to execute");
                break;
              case 404:
                errorEntity(code: errCode, message: "Can not reach server");
                break;
              case 405:
                errorEntity(
                    code: errCode, message: "Request method is forbidden");
                break;
              case 500:
                errorEntity(code: errCode, message: "Internal server error");
                break;
              case 502:
                errorEntity(code: errCode, message: "Invalid request");
                break;
              case 503:
                errorEntity(code: errCode, message: "Server hangs");
                break;
              case 505:
                errorEntity(
                    code: errCode,
                    message: "HTTP protocol requests are not supported");
                break;
              default:
                errorEntity(
                    code: errCode,
                    message:
                        error.response != null ? error.response!.data! : "");
            }
          } on Exception catch (_) {
            errorEntity(code: 0, message: "Unknown mistake");
          }
        }
        break;
      case DioExceptionType.connectionError || DioExceptionType.unknown:
        if (error.message!.contains("The connection errored") ||
            error.message!.contains("Socket")) {
          errorEntity(
              code: -5,
              message:
                  "Your internet is not available, please try again later");
        } else if (error.message!
            .contains("Software caused connection abort")) {
          errorEntity(
              code: -6,
              message:
                  "Your internet is not available, please try again later");
        } else {
          errorEntity(code: -7, message: "Oops something went wrong");
        }
        break;
      default:
        errorEntity(code: -8, message: "Oops something went wrong");
        break;
    }
  }

  void cancelRequests() {
    cancelToken.cancel("cancelled");
  }

  /// restful get
  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool refresh = false,
    bool noCache = true,
    bool list = false,
    String cacheKey = '',
    bool cacheDisk = false,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.extra ??= {};
    requestOptions.extra!.addAll({
      "refresh": refresh,
      "noCache": noCache,
      "list": list,
      "cacheKey": cacheKey,
      "cacheDisk": cacheDisk,
    });

    var response = await dio.get(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful post
  Future post(
    String path, {
    FormData? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();

    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// with out form data
  Future withOutFormData(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    printAction("---------path----------\$path");
    printAction("----------data---------\$data");
    var response = await dio.post(
      path,
      data: data,
      options: Options(headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
      }),
    );
    return response.data;
  }

  /// restful put
  Future put(
    String path, {
    FormData? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();

    var response = await dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful delete
  Future delete(
    String path, {
    FormData? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();

    var response = await dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful patch
  Future patch(
    String path, {
    FormData? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();

    var response = await dio.patch(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful post form
  Future postForm(
    String path, {
    FormData? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();

    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful post Stream
  Future postStream(
    String path, {
    dynamic data,
    int dataLength = 0,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();

    requestOptions.headers!.addAll({
      Headers.contentLengthHeader: dataLength.toString(),
    });
    var response = await dio.post(
      path,
      data: Stream.fromIterable(data.map((e) => [e])),
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  void errorEntity({
    required code,
    required message,
  }) {
    Loading.dismiss();
    if (!utils.isValidationEmpty(message)) {
      printAction("test_message: \$message");
      showToast(message: message);
    }
  }
}

class ErrorEntity implements Exception {
  int code = -1;
  String message = "";

  ErrorEntity({
    required this.code,
    required this.message,
  });

  @override
  String toString() {
    printAction("test_message: \$message");

    if (!utils.isValidationEmpty(message)) {
      printAction("test_message: \$message");
      showToast(message: message);
    }

    if (message == "") {
      return "Exception";
    } else {
      return "Exception: code \$code, \$message";
    }
  }
}

class CommonResponse {
  final int responseCode;
  final String responseMsg;
  final String result;
  final String serverTime;
  final String? isPurchase;
  final String? expireDate;
  final dynamic data;

  CommonResponse({
    required this.result,
    required this.responseCode,
    required this.responseMsg,
    required this.serverTime,
    this.data,
    this.isPurchase,
    this.expireDate,
  });

  factory CommonResponse.fromJson(Map<String, dynamic> json) => CommonResponse(
        data: json['data'] ?? "",
        serverTime: json['ServerTime'],
        responseCode: json['ResponseCode'],
        responseMsg: json['ResponseMsg'],
        result: json['Result'],
        isPurchase: json['is_purchase'] ?? "0",
        expireDate: json['expire_date'] ?? "",
      );
}

''',
    );
