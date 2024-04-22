// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englishquizapp/data/models/question.dart';
//import 'package:englishquizapp/data/models/quiz_question.dart';

const String QUESTION_COLLECTION = 'questions';

final _firestore = FirebaseFirestore.instance;

class QuestionService {
  Future<List<Questions>> getQuestion() async {
    try {
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

  Future<List<Questions>> getQuestionsFromFirebase() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection(QUESTION_COLLECTION).get();

    List<Questions> questionsList = [];
    querySnapshot.docs.forEach((doc) {
      questionsList.add(Questions(
        content: doc['content'],
        answers: [doc['ans1'], doc['ans2'], doc['ans3'], doc['ans4']],
        difficulty: doc['difficulty'],
        //point: doc['point'],
      ));
    });

    return questionsList;
  }
}
