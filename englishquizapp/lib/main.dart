import 'package:englishquizapp/modules/quiz.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // FirebaseFirestore.instance.settings =
  //     const Settings(persistenceEnabled: true);
  runApp(const Quiz());
}
