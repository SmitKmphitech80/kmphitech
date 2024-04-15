import 'dart:io';

String apiRepoPath = "lib/app/api_repository";
String helperPath = "lib/app/helper";
String utilsPath = "lib/app/utils";
String presentataionDirPath = "lib/app/presentataion";
String routesDirPath = "lib/app/routes";

/// const strings
String mainScreen = "main";
String apiclass = "apiclass";
String apifunction = "apifunction";
String loading = "loading";
String getstorage = "getstorage";
String helpe = "helpe";
String constant = "constant";
String fontsize = "fontsize";
String utils = "utils";
String apppages = "apppages";
String routes = "routes";


void addData({required String path, required String content}) {
  final file = File(path);
  file.writeAsStringSync(content);
}
