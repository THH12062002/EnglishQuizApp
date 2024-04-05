import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englishquizapp/modules/quiz.dart';
import 'package:englishquizapp/showaccount.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'data/service/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings =
      const Settings(persistenceEnabled: true);
  runApp(const Quiz());
}
