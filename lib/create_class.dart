import 'dart:io';

import 'package:kmphitech/constants.dart';

Future<void> createClass(String name) async {
  RegExp pattern = RegExp(r'[-]');
  String newName = name.trim().replaceAll(pattern, '');

  String className = getClassName(name);

  /// create folder
  final appDir = Directory("$presentataionDirPath/${newName}_screen");
  await appDir.create();

  /// create controller folder
  final controllerDir =
      Directory("$presentataionDirPath/${newName}_screen/controller");
  await controllerDir.create();

  /// create binding folder
  final bindingDir =
      Directory("$presentataionDirPath/${newName}_screen/bindings");
  await bindingDir.create();

  /// create screens folder
  final screensDir =
      Directory("$presentataionDirPath/${newName}_screen/screens");
  await screensDir.create();

  /// create controller class
  addData(
    path:
        "$presentataionDirPath/${newName}_screen/controller/${newName}_controller.dart",
    content: '''
import 'package:get/get.dart';

class ${className}Controller extends GetxController {}
''',
  );

  /// create bindings class
  addData(
    path:
        "$presentataionDirPath/${newName}_screen/bindings/${newName}_bindings.dart",
    content: '''
import 'package:get/get.dart';

import '../controller/${newName}_controller.dart';

class ${className}Binding extends Bindings {
  @override
  void dependencies() {
    Get.put<${className}Controller>(
      ${className}Controller(),
    );
  }
}
''',
  );

  /// create views class
  addData(
    path:
        "$presentataionDirPath/${newName}_screen/screens/${newName}_screens.dart",
    content: '''
import 'package:flutter/material.dart';

import '../controller/${newName}_controller.dart';

class ${className}Screen extends GetView<${className}Controller> {
  const ${className}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${className}Screen'),
      ),
      body: Center(
        child: Text("${className}Screen"),
      ),
    );
  }
}

''',
  );
}

String getClassName(String name) {
  String className = "";
  RegExp pattern = RegExp(r'[_-]');

  name.split(pattern).forEach((element) {
    className += element[0].toUpperCase() + element.substring(1).toLowerCase();
  });
  return className;
}
