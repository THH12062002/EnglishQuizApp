import 'package:englishquizapp/data/models/question.dart';
import 'package:englishquizapp/modules/questions/blocks/question_state.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class QuestionController extends GetxController {
  late List<Questions> questions;
  late List<QuestionState>? questionStates;
  late int? initialIndex;
  int currentIndex = 0;
  int score = 0;
  late List<List<int>> selectedAnswerIndices;
  late List<bool> questionFlags;

  late List<int> flaggedQuestions = [];

  void initState() {
    //super.initState();
    currentIndex = initialIndex ?? 0;
    selectedAnswerIndices = List.generate(questions.length, (_) => []);
    questionFlags = List.generate(questions.length, (_) => false);
    questionStates = questionStates ??
        List.generate(questions.length, (index) {
          return QuestionState(
            questionIndex: index,
            selectedAnswerIndex: -1,
            correctAnswerIndex: 0,
          );
        });
  }
}
