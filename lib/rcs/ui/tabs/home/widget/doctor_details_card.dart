import 'package:flutter/material.dart';
import 'package:medical_consultation/rcs/model/doctors_model.dart';
import 'package:medical_consultation/rcs/utils/app_colors.dart';

class DoctorDetailsCard extends StatefulWidget {
  const DoctorDetailsCard({super.key, required this.doctorDetails});
  final Doctor doctorDetails;
  @override
  State<DoctorDetailsCard> createState() => _DoctorDetailsCardState();
}

class _DoctorDetailsCardState extends State<DoctorDetailsCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.doctorDetails.img!),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.doctorDetails.specialist!,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors().greyColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    widget.doctorDetails.doctorName!,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColors().blackColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 15,
                    ),
                    Text(
                      '${widget.doctorDetails.rating!} - ${widget.doctorDetails.reviews!} Reviews',
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors().blackColor,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
