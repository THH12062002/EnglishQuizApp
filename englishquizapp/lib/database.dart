// import 'package:cloud_firestore/cloud_firestore.dart';

// class DatabaseMethods {
//   Future addAccount(Map<String, dynamic> accountData, String accountId) async {
//     return await FirebaseFirestore.instance
//         .collection("Account")
//         .doc(accountId)
//         .set(accountData);
//   }

//   Future<Stream<QuerySnapshot>> getAccountDetail() async {
//     return await FirebaseFirestore.instance.collection("Account").snapshots();
//   }
// }
