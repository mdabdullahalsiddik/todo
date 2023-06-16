import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList titlle = [].obs;
  RxString text = "".obs;
  RxList edit = [].obs;
  void tittleName(name) {
    titlle.add(name);

    update();
  }

  void tittleUpdate(name) {
    update();
  }

  void tittleDelet(name) {
    titlle.removeAt(name);

    update();
  }

  void editText(texts) {
    text.value = texts;
    update();
  }

  void editName(name) {
    edit.add(name);

    update();
  }
}
