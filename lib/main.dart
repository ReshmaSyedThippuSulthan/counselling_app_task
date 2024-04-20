import 'package:counselling_task/Country_Selection/selection_country.dart';
import 'package:counselling_task/Country_Selection/selection_country1.dart';
import 'package:counselling_task/Startup_Screen/termsandconditions.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const StudyLancer());
}

class StudyLancer extends StatelessWidget {
  const StudyLancer({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TermsAndService(),
    );
  }
}
