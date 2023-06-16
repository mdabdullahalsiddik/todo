import 'package:get/get.dart';
import 'package:notepad/pages/edit.dart';
import 'package:notepad/pages/home.dart';

const String homePage = "/homePage";
const String editPage = "/editPage";

List<GetPage> page = [
  GetPage(name: homePage, page: () => HomePage(),),
  GetPage(name: editPage, page: () => NoteEdit(),),
];
