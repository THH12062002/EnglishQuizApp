import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class QuestionStorage extends GetxController {
  final box = GetStorage();

  void saveQuestion({
    String? ans1,
    String? ans2,
    String? ans3,
    String? ans4,
    String? point,
    String? content,
    String? difficulty,
  }) {
    box.write('ans1', ans1);
    box.write('ans2', ans2);
    box.write('ans3', ans3);
    box.write('ans4', ans4);
    box.write('point', point);
    box.write('content', content);
    box.write('difficulty', difficulty);
  }

  String? get ans1 => box.read('ans1');
  String? get ans2 => box.read('ans2');
  String? get ans3 => box.read('ans3');
  String? get ans4 => box.read('ans4');
  String? get point => box.read('point');
  String? get content => box.read('content');
  String? get difficulty => box.read('difficulty');
}
