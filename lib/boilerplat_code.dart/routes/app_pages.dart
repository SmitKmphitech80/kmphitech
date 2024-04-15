import 'package:kmphitech/constants.dart';

void addAppPages() => addData(
      path: "$routesDirPath/app_pages.dart",
      content: '''
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const Container(),
    ),
  ];
}

''',
    );
