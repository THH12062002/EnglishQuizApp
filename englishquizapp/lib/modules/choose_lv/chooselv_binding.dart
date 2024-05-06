import 'package:englishquizapp/modules/choose_lv/chooselv_controller.dart';
import 'package:get/get.dart';

class ChooseLvBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChooseLvController>(() => ChooseLvController());
  }
}
