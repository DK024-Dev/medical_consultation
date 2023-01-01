import 'package:flutter/material.dart';
import 'package:medical_consultation/rcs/ui/bottom_navigation.dart';

class MedicalConsultationApp extends StatelessWidget {
  const MedicalConsultationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppBottomNavigationBar(),
    );
  }
}
