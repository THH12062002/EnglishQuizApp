import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englishquizapp/data/service/database_service.dart';
import 'package:englishquizapp/data/models/user.dart';
import 'package:flutter/material.dart';

class ShowAccount extends StatelessWidget {
  ShowAccount({super.key});

  final DatabaseService _databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: FutureBuilder<List<User>>(
              future: _databaseService.fetchData(),
              builder: (context, AsyncSnapshot<List<User>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Show loading indicator while data is being fetched
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<User> userList = snapshot.data ?? [];
                  return ListView.builder(
                      itemCount: userList.length,
                      itemBuilder: (context, index) {
                        User user = userList[index];
                        return ListTile(
                          title: Text('Username: ${user.username}'),
                          subtitle: Text('Password: ${user.password}'),
                        );
                      });
                }
              }),
        ),
      ),
    );
  }
}
