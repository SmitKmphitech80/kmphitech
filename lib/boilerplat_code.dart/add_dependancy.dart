import 'dart:io';

void addDependancy() {
  File file = File("pubspec.yaml");

  String fileContent = file.readAsStringSync();

  if (!fileContent.contains('dependencies:')) {
    fileContent += '\ndependencies:\n';
  }

  String dependencyString = "  dio: ^5.4.3+1\n"
      "  cookie_jar: ^4.0.8\n"
      "  get_storage: ^2.1.1\n"
      "  fluttertoast: ^8.2.5\n"
      "  dio_cookie_manager: ^3.1.1\n"
      "  flutter_easyloading: ^3.0.5\n";

  int dependenciesIndex = fileContent.indexOf('dependencies:');

  if (dependenciesIndex != -1) {
    // Insert the new dependency string after the dependencies section
    int insertIndex = fileContent.indexOf('\n', dependenciesIndex) + 1;
    fileContent = fileContent.substring(0, insertIndex) +
        dependencyString +
        fileContent.substring(insertIndex);
  }
  file.writeAsStringSync(fileContent);
}
