import 'package:flutter/material.dart';
import 'package:medical_consultation/rcs/app.dart';
import 'package:medical_consultation/rcs/manager/storage_manager.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.value(StorageManager().initializeSharedPreference);
  runApp(const MedicalConsultationApp());
}
