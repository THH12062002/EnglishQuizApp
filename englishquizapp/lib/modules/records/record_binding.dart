import 'package:englishquizapp/modules/records/record_controller.dart';
import 'package:get/get.dart';

class RecordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RecordController());
  }
}
