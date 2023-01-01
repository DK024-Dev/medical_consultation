import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:medical_consultation/rcs/utils/app_colors.dart';
import 'package:medical_consultation/rcs/utils/app_images.dart';
import 'package:medical_consultation/rcs/utils/constant.dart';

class CardStack extends StatefulWidget {
  const CardStack({super.key});

  @override
  State<CardStack> createState() => _CardStackState();
}

class _CardStackState extends State<CardStack> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 30,
            child: Container(
              height: DeviceMediaQuery(context).height / 4.5,
              width: DeviceMediaQuery(context).width - 120,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors().blueColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Positioned(
            top: 20,
            child: Container(
              height: DeviceMediaQuery(context).height / 4.5,
              width: DeviceMediaQuery(context).width - 80,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors().blueColor.withOpacity(0.6),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Positioned(
            top: 10,
            child: Container(
              height: DeviceMediaQuery(context).height / 4.5,
              width: DeviceMediaQuery(context).width - 40,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages().backgroundImg),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: DeviceMediaQuery(context).height / 12,
                        width: DeviceMediaQuery(context).height / 12,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(drImages[1]),
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          height: DeviceMediaQuery(context).height / 12,
                          width: DeviceMediaQuery(context).height / 12,
                          color: AppColors().whiteColor.withOpacity(0.4),
                          child: Icon(
                            CupertinoIcons.chat_bubble_2,
                            color: AppColors().whiteColor,
                            size: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'dr. Ino Yamanaka',
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: AppColors().whiteColor,
                          ),
                        ),
                      ),
                      Text(
                        '10.30 AM',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: AppColors().whiteColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Dental Specialist',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors().whiteColor.withOpacity(0.5),
                        ),
                      ),
                      Text(
                        '01.10.2022',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors().whiteColor.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
