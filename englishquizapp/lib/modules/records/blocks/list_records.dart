// ignore_for_file: prefer_const_constructors

import 'package:englishquizapp/modules/records/record_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Add this import for DateFormat

class ListRecord extends StatelessWidget {
  const ListRecord({Key? key});

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
                  return PopupMenuButton<String>(
                    onSelected: (value) {
                      recordController.updateDifficulty(value);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(recordController.selectedDifficulty.value),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                    itemBuilder: (context) => <String>[
                      'All',
                      'Easy',
                      'Medium',
                      'Hard'
                    ].map<PopupMenuEntry<String>>((String value) {
                      return PopupMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  );
                }),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Obx(() {
                  return ElevatedButton(
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('dd-MM-yyyy').format(pickedDate);
                        recordController.updateDate(formattedDate);
                      }
                    },
                    child: Text(recordController.selectedDate.isEmpty
                        ? 'Select Date'
                        : recordController.selectedDate.value),
                  );
                }),
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
