import 'dart:convert';

ChatList chatListFromJson(String str) => ChatList.fromJson(json.decode(str));

class ChatList {
  ChatList({this.doctorsChat});

  List<DoctorsChat>? doctorsChat;

  factory ChatList.fromJson(Map<String, dynamic> json) => ChatList(
        doctorsChat: List<DoctorsChat>.from(
            json['doctors_chat'].map((x) => DoctorsChat.fromJson(x))),
      );
}

class DoctorsChat {
  DoctorsChat({
    this.doctorName,
    this.lastSeen,
    this.img,
    this.content,
    this.badge,
  });

  String? doctorName;
  String? img;
  String? lastSeen;
  String? content;
  int? badge;

  factory DoctorsChat.fromJson(Map<String, dynamic> json) => DoctorsChat(
        doctorName: json['doctor_name'],
        img: json['img'],
        lastSeen: json['last_seen'],
        content: json['content'],
        badge: json['badge'],
      );

  Map<String, dynamic> toJson() => {
        'doctor_name': doctorName,
        'img': img,
        'last_seen': lastSeen,
        'content': content,
        'badge': badge,
      };
}
