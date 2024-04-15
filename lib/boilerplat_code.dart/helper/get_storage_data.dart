import 'package:kmphitech/constants.dart';

void addStorageData() => addData(
      path: "$helperPath/get_storage_data.dart",
      content: '''
import 'dart:convert';
import 'package:get_storage/get_storage.dart';

/// GetStorageData instance
GetStorageData storage = GetStorageData();

/// <<< To store data in phone storage --------- >>>
class GetStorageData {
  String loginData = "loginData";
  String userId = "userId";
  String token = "token";
  String email = "email";
  String isSubscription = "is_subscription";
  String deviceId = "deviceId";
  String isFirst = "Is First";

  /// <<< To save String data --------- >>>
  saveString(String key, value) async {
    final box = GetStorage();
    return box.write(key, value);
  }

  /// <<< To read String data --------- >>>
  readString(String key) {
    final box = GetStorage();
    if (box.hasData(key)) {
      return box.read(key);
    } else {
      return null;
    }
  }

  /// <<< To save object data --------- >>>
  saveObject(String key, value) {
    final box = GetStorage();
    String allData = jsonEncode(value);
    box.write(key, allData);
  }

  /// <<< To read object data --------- >>>
  readObject(String key) {
    final box = GetStorage();
    var result = box.read(key);
    return result == null ? null : jsonDecode(result);
  }

  /// <<< To save boolean data --------- >>>
  saveBoolean(String key, value) {
    final box = GetStorage();
    String allData = jsonEncode(value);
    box.write(key, allData);
  }

  /// <<< To read boolean data --------- >>>
  readBoolean(String key) {
    final box = GetStorage();
    var result = box.read(key);
    return result ?? true;
  }

  /// <<< To remove data --------- >>>
  removeData(String key) async {
    final box = GetStorage();
    return box.remove(key);
  }
}
''',
    );
