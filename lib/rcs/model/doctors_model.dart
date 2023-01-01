import 'dart:convert';

Doctors doctorsFromJson(String str) => Doctors.fromJson(json.decode(str));

class Doctors {
  Doctors({this.doctors});

  List<Doctor>? doctors;

  factory Doctors.fromJson(Map<String, dynamic> json) => Doctors(
        doctors:
            List<Doctor>.from(json['doctors'].map((x) => Doctor.fromJson(x))),
      );
}

class Doctor {
  Doctor({
    this.doctorName,
    this.img,
    this.specialist,
    this.about,
    this.patients,
    this.experience,
    this.reviews,
    this.rating,
  });

  String? doctorName;
  String? img;
  String? specialist;
  String? about;
  int? patients;
  int? experience;
  int? reviews;
  double? rating;

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        doctorName: json['doctor_name'],
        img: json['img'],
        specialist: json['specialist'],
        about: json['about'],
        patients: json['patients'],
        experience: json['experience'],
        reviews: json['reviews'],
        rating: json['rating'].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'doctor_name': doctorName,
        'img': img,
        'specialist': specialist,
        'about': about,
        'patients': patients,
        'experience': experience,
        'reviews': reviews,
        'rating': rating,
      };
}
