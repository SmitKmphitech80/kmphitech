import 'dart:io';

import 'package:kmphitech/constants.dart';

void addMainScreen() => addData(
      path: "lib/main.dart",
      content: '''
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info/package_info.dart';
        
Future<void> main() async {
  Loading();
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  Utils.lightStatusBar();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  Constants.setVersionNumber(
    await PackageInfo.fromPlatform(),
  );
  runApp(const MyApp());
}
        
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: SplashBinding(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      title: AppString.swiftStudy,
      builder: EasyLoading.init(),
    );
  }
}
''',
    );

Future<void> createFolder() async {
  /// create app folder
  final appDir = Directory("lib/app");
  await appDir.create();

  /// create api repo folder
  final apiRepoDir = Directory(apiRepoPath);
  await apiRepoDir.create();

  /// create helper folder
  final helperDir = Directory(helperPath);
  await helperDir.create();

  /// create utils folder
  final utilsDir = Directory(utilsPath);
  await utilsDir.create();

  /// create presentataion folder
  final presentataionDir = Directory(presentataionDirPath);
  await presentataionDir.create();

  /// create routes folder
  final routesDir = Directory(routesDirPath);
  await routesDir.create();
}
