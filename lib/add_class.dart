import 'dart:io';

import 'package:kmphitech/constants.dart';
import 'package:kmphitech/create_class.dart';

Future<void> addClass(List<String> argList) async {
  RegExp pattern = RegExp(r'[-%&*]');
  String existingClass = "";
  List<String> newClassList = [];
  argList.forEach((element) {
    if (element.contains("add:") && element != "add:") {
      existingClass = element.replaceAll("add:", "");
    } else if (element != "add:") {
      if (existingClass.isEmpty) {
        existingClass = argList[1];
      }
      if (existingClass != element) {
        newClassList.add(element.trim().replaceAll(pattern, ''));
      }
    }
  });

  existingClass.replaceAll("_screen", "");
  String newExistingClass = existingClass.trim().replaceAll(pattern, '');

  final file = File(
    "$presentataionDirPath/${newExistingClass}_screen/screens/${newExistingClass}_screens.dart",
  );

  print(
      ":====>> ${file.path} == ${await file.exists()} = ${newClassList.length}");

  if (await file.exists()) {
    newClassList.forEach((element) {
      String className = getClassName(element);
      String existingClassName = getClassName(newExistingClass);

      /// create views class
      addData(
        path:
            "$presentataionDirPath/${newExistingClass}_screen/screens/${element}_screens.dart",
        content: '''
import 'package:flutter/material.dart';

import '../controller/${newExistingClass}_controller.dart';

class ${className}Screen extends StatelessWidget {
  const ${className}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    ${existingClassName}Controller controller = Get.find<${existingClassName}Controller>();
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
    });
  } else {
    await createClass(newExistingClass)
        .then((value) async => await addClass(argList));
  }
}
