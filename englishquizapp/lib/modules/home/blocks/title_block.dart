// ignore_for_file: prefer_const_constructors

import 'package:englishquizapp/modules/home/blocks/help_dialog.dart';
import 'package:englishquizapp/modules/login/login_page.dart';
import 'package:englishquizapp/modules/records/record_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart'; // Import GetX package if needed for navigation

class TitleBlock extends StatelessWidget {
  const TitleBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          top: 7,
          child: IconButton(
            iconSize: 33,
            icon: Icon(Icons.help_outline, color: Colors.white),
            onPressed: () {
              // Display the help dialog with PageView
              showDialog(
                context: context,
                builder: (context) => HelpDialog(),
              );
            },
          ),
        ),
        Center(
          child: Text(
            'Let\'s Learn English!',
            style: GoogleFonts.lato(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 7,
          child: PopupMenuButton<String>(
            iconSize: 33,
            icon: Icon(Icons.account_circle, color: Colors.white),
            onSelected: (value) {
              // Handle the selected option
              if (value == 'Your Records') {
                // Navigate to Your Records page
                Get.to(() => RecordPage());
              } else if (value == 'Logout') {
                // Perform logout operation
                Get.to(() => LoginPage());
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'Your Records',
                  child: Text('Your Records'),
                ),
                PopupMenuItem<String>(
                  value: 'Logout',
                  child: Text('Logout'),
                ),
              ];
            },
          ),
        ),
      ],
    );
  }
}
