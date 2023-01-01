import 'package:flutter/material.dart';
import 'package:medical_consultation/rcs/model/chat_model.dart';
import 'package:medical_consultation/rcs/utils/app_colors.dart';

class DoctorChatCard extends StatefulWidget {
  const DoctorChatCard({super.key, required this.doctorsChat});
  final DoctorsChat doctorsChat;
  @override
  State<DoctorChatCard> createState() => _DoctorChatCardState();
}

class _DoctorChatCardState extends State<DoctorChatCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.doctorsChat.img!),
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                Container(
                  height: 13,
                  width: 13,
                  margin: const EdgeInsets.only(bottom: 2, right: 2),
                  decoration: BoxDecoration(
                    color: Colors.green.shade400,
                    borderRadius: BorderRadius.circular(100),
                  ),
                )
              ],
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.doctorsChat.doctorName!,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 18,
                              color: AppColors().blackColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        widget.doctorsChat.lastSeen!,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: TextStyle(
                          color: AppColors().greyColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.doctorsChat.content!,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors().greyColor,
                          ),
                        ),
                      ),
                      widget.doctorsChat.badge != 0 &&
                              widget.doctorsChat.badge != null
                          ? Container(
                              height: 18,
                              width: 18,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors().blueColor,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Text(
                                widget.doctorsChat.badge.toString(),
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: AppColors().whiteColor,
                                ),
                              ),
                            )
                          : const SizedBox()
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
