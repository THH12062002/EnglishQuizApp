// ignore_for_file: prefer_const_constructors

import 'package:englishquizapp/modules/records/record_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListRecord extends StatelessWidget {
  const ListRecord({super.key});

  @override
  Widget build(BuildContext context) {
    final RecordController recordController = Get.put(RecordController());

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Obx(() {
                  return DropdownButton<String>(
                    value: recordController.selectedDifficulty.value,
                    onChanged: (value) {
                      if (value != null) {
                        recordController.updateDifficulty(value);
                      }
                    },
                    items: <String>['All', 'Easy', 'Medium', 'Hard']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  );
                }),
              ),
              SizedBox(width: 16),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter date (YYYY-MM-DD)',
                  ),
                  onChanged: (value) {
                    recordController.updateDate(value);
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Obx(() {
            return ListView.builder(
              itemCount: recordController.filteredRecords.length,
              itemBuilder: (context, index) {
                final record = recordController.filteredRecords[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Score: ${record.score}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Difficulty: ${record.difficulty}',
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[700]),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Datetime: ${record.datetime}',
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[500]),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }
}
