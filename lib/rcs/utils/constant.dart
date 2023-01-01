import 'package:flutter/material.dart';
import 'package:medical_consultation/rcs/utils/app_images.dart';
import 'package:medical_consultation/rcs/utils/app_strings.dart';

class DeviceMediaQuery {
  DeviceMediaQuery(this.context);
  final BuildContext context;

  double get height => MediaQuery.of(context).size.height;
  double get width => MediaQuery.of(context).size.width;
}

//Sample Iimage
final List<String> drImages = [
  AppImages().dr1,
  AppImages().dr2,
  AppImages().dr3,
  AppImages().dr4,
  AppImages().dr5,
  AppImages().dr6,
  AppImages().dr7,
];

// Doctor Data

final Map<String, dynamic> doctorJson = {
  'doctors': [
    {
      "doctor_name": "dr. Ino Yamanaka",
      "specialist": "Dental Specialist",
      "img": AppImages().dr2,
      "about": AppStrings.sampleText,
      "patients": 1034,
      "experience": 4,
      "reviews": 112,
      "rating": 3.8
    },
    {
      "doctor_name": "dr. Kabuto Yakushi",
      "specialist": "Heart Specialist",
      "img": AppImages().dr3,
      "about": AppStrings.sampleText,
      "patients": 500,
      "experience": 2,
      "reviews": 132,
      "rating": 4.5
    },
    {
      "doctor_name": "dr. Orochimaru",
      "specialist": "Homeopethic",
      "img": AppImages().dr4,
      "about": AppStrings.sampleText,
      "patients": 943,
      "experience": 3,
      "reviews": 80,
      "rating": 2.8
    },
    {
      "doctor_name": "dr. Kojiro Hyuga",
      "specialist": "Cardiologist",
      "img": AppImages().dr5,
      "about": AppStrings.sampleText,
      "patients": 1100,
      "experience": 8,
      "reviews": 120,
      "rating": 3.2
    },
    {
      "doctor_name": "dr. Benjamin Mullet",
      "specialist": "M.B.B.S",
      "img": AppImages().dr6,
      "about": AppStrings.sampleText,
      "patients": 250,
      "experience": 1,
      "reviews": 110,
      "rating": 4.0
    },
    {
      "doctor_name": "dr. Adam John",
      "specialist": "M.S",
      "img": AppImages().dr7,
      "about": AppStrings.sampleText,
      "patients": 2011,
      "experience": 10,
      "reviews": 190,
      "rating": 4.2
    }
  ]
};

//Chatlist data
final Map<String, dynamic> chatListJson = {
  "doctors_chat": [
    {
      "doctor_name": "dr. Ino Yamanaka",
      "img": AppImages().dr1,
      "last_seen": "10:20 AM",
      "content": "Ready to check out today?",
      "badge": 0
    },
    {
      "doctor_name": "dr. Kabuto Yakushi",
      "last_seen": "10:20 AM",
      "img": AppImages().dr2,
      "content": "Take care of your health",
      "badge": 0
    },
    {
      "doctor_name": "dr. Orochimaru",
      "last_seen": "10:20 AM",
      "img": AppImages().dr3,
      "content": "Come tomorrow on time :)",
      "badge": 4
    },
    {
      "doctor_name": "dr. Kojiro Hyuga",
      "last_seen": "10:20 AM",
      "img": AppImages().dr4,
      "content": "Do not sleep too late, Jane",
      "badge": 8
    },
    {
      "doctor_name": "dr. Benjamin Mullet",
      "last_seen": "10:20 AM",
      "img": AppImages().dr5,
      "content": "Dont forgot to take medicine on time",
      "badge": 0
    },
    {
      "doctor_name": "dr. Adam John",
      "last_seen": "10:20 AM",
      "img": AppImages().dr6,
      "content": "Get well soon, Jane",
      "badge": 5
    }
  ]
};
