import 'package:kmphitech/constants.dart';

void addFontSize() => addData(
      path: "$utilsPath/font_size.dart",
      content: '''
class FontSize {
  static double s10 = 10;
  static double s12 = 12;
  static double s14 = 14;
  static double s16 = 16;
  static double s18 = 18;
  static double s20 = 20;
  static double s22 = 22;
  static double s24 = 24;
  static double s26 = 26;
}
''',
    );
