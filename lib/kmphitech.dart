import 'package:args/args.dart';
import 'package:kmphitech/add_class.dart';
import 'package:kmphitech/boilerplat_code.dart/add_main.dart';
import 'package:kmphitech/boilerplat_code.dart/api_repo/api_class.dart';
import 'package:kmphitech/boilerplat_code.dart/api_repo/api_function.dart';
import 'package:kmphitech/boilerplat_code.dart/api_repo/loading.dart';
import 'package:kmphitech/boilerplat_code.dart/helper/get_storage_data.dart';
import 'package:kmphitech/boilerplat_code.dart/helper/helper.dart';
import 'package:kmphitech/boilerplat_code.dart/routes/app_pages.dart';
import 'package:kmphitech/boilerplat_code.dart/routes/app_routes.dart';
import 'package:kmphitech/boilerplat_code.dart/utils/app_color_icon_img.dart';
import 'package:kmphitech/boilerplat_code.dart/utils/app_strings.dart';
import 'package:kmphitech/boilerplat_code.dart/utils/constant.dart';
import 'package:kmphitech/boilerplat_code.dart/utils/font_size.dart';
import 'package:kmphitech/boilerplat_code.dart/utils/utils.dart';
import 'package:kmphitech/constants.dart';
import 'package:kmphitech/create_class.dart';

class MyFlutterCli {
  Future<void> generate(List<String> arguments) async {
    final parser = ArgParser()
      ..addOption('name', abbr: 'n', help: 'Name of the project')
      ..addFlag('help',
          abbr: 'h', help: 'Display help information', negatable: false);

    final argResults = parser.parse(arguments);

    if (argResults['help'] as bool) {
      print('Usage: my_flutter_cli --name <project_name>');
      print(parser.usage);
      return;
    }

    bool oneClassCondition(String arg) {
      RegExp pattern = RegExp(r'[^\w]');
      String newArg = arg.replaceAll(pattern, '');
      return ((arguments.length >= 2 &&
              arguments.any((element) =>
                  element.toLowerCase() == newArg.toLowerCase())) ||
          arguments.length == 1);
    }

    if (arguments.isNotEmpty) {
      if (arguments.first == "init") {
        await createFolder();
        if (oneClassCondition(mainScreen)) addMainScreen();
        if (oneClassCondition(apiclass)) addApiClass();
        if (oneClassCondition(apifunction)) addApiFunction();
        if (oneClassCondition(loading)) addLoader();
        if (oneClassCondition(getstorage)) addStorageData();
        if (oneClassCondition(helpe)) addHelper();
        if (arguments.length == 1) addColorImgIcon();
        if (arguments.length == 1) addString();
        if (oneClassCondition(constant)) addContants();
        if (oneClassCondition(fontsize)) addFontSize();
        if (oneClassCondition(utils)) addUtils();
        if (oneClassCondition(apppages)) addAppPages();
        if (oneClassCondition(routes)) addRouteString();
      } else if (arguments.first.contains("create:")) {
        await createFolder();
        if (arguments.length == 1) {
          await createClass(arguments.first.split("create:")[1]);
        } else if (arguments.length >= 2) {
          arguments.forEach((element) async {
            if (element.contains("create:") && element != "create:") {
              await createClass(element.replaceAll("create:", ""));
            } else if (element != "create:") {
              await createClass(element);
            }
          });
        }
      } else if (arguments.first.contains("add:")) {
        await createFolder().then((value) async {
          await addClass(arguments);
        });
      }
    }

    // final projectName = argResults['name'] as String?;

    // if (projectName == null) {
    //   print('Error: --name option is required');
    //   print(parser.usage);
    //   exit(1);
    // }

    // generateFlutterBoilerplate(projectName);
  }
}
