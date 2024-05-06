import 'package:englishquizapp/modules/questions/question_controller.dart';
import 'package:get/get.dart';

class QuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionController>(() => QuestionController());
  }
}
