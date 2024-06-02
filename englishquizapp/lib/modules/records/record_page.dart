// ignore_for_file: prefer_const_constructors

import 'package:englishquizapp/modules/home/home_page.dart';
import 'package:englishquizapp/modules/records/blocks/list_records.dart';
import 'package:englishquizapp/modules/records/blocks/title_record_block.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecordPage extends StatelessWidget {
  const RecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(235, 115, 102, 251),
        ),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 50),
              TitleRecordBlock(),
              SizedBox(height: 40),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 500), // Set a max height
                child: ListRecord(),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Get.to(HomePage());
                },
                child: Text('Back to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
