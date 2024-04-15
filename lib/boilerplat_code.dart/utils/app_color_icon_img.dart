import 'package:kmphitech/constants.dart';

void addColorImgIcon() => addData(
      path: "$utilsPath/app_colors.dart",
      content: '''
import 'dart:ui';

class AppColors {
  static const Color primaryColor = Color(0xFF6001D3);
  static const Color primaryTextColor = Color(0xFF09051C);
}

''',
    );

void addImages() => addData(
      path: "$utilsPath/app_images.dart",
      content: '''
class AppImages {
  static const String path = "assets/images/";
}

''',
    );

void addIcons() => addData(
      path: "$utilsPath/app_icons.dart",
      content: '''
class AppIcons {
  static const String path = "assets/icons/";
}

''',
    );
