import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englishquizapp/user.dart';

const String USER_COLLECTION = 'users';

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _usersRef;

  DatabaseService() {
    _usersRef = _firestore.collection(USER_COLLECTION).withConverter<User>(
        fromFirestore: (snapshots, _) => User.fromJson(
              snapshots.data()!,
            ),
        toFirestore: (user, _) => user.toJson());
  }

  // Stream<QuerySnapshot> getUsers() {
  //   return _usersRef.snapshots();
  // }

  Future<List<User>> fetchData() async {
    try {
      // Access the collection named 'users'
      CollectionReference users = _firestore.collection(USER_COLLECTION);

      // Query for documents
      QuerySnapshot querySnapshot = await users.get();

      // Iterate through documents and create User objects
      List<User> userList = querySnapshot.docs
          .map((doc) => User.fromDocumentSnapshot(doc))
          .toList();

      return userList;
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }

  void addUser(User user) async {
    _usersRef.add(user);
  }
}
