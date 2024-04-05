import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englishquizapp/data/models/question.dart';

const String QUESTION_COLLECTION = 'questions';

class QuestionService {
  // late final CollectionReference _questionsRef;

  // QuestionService() {
  //   _questionsRef =
  //       _firestore.collection(QUESTION_COLLECTION).withConverter<Questions>(
  //           fromFirestore: (snapshots, _) => Questions.fromJson(
  //                 snapshots.data()!,
  //               ),
  //           toFirestore: (question, _) => question.toJson());
  // }

  Future<List<Questions>> getQuestion() async {
    try {
      final _firestore = FirebaseFirestore.instance;
      CollectionReference questions =
          _firestore.collection(QUESTION_COLLECTION);
      QuerySnapshot querySnapshot = await questions.get();
      List<Questions> questionList = querySnapshot.docs
          .map((doc) => Questions.fromDocumentSnapshot(doc))
          .toList();
      return questionList;
    } catch (e) {
      return [];
    }
  }
}
