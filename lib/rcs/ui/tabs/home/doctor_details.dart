import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medical_consultation/rcs/model/doctors_model.dart';
import 'package:medical_consultation/rcs/ui/tabs/home/widget/label_with_see_all.dart';
import 'package:medical_consultation/rcs/utils/app_colors.dart';
import 'package:medical_consultation/rcs/utils/app_images.dart';
import 'package:medical_consultation/rcs/utils/app_strings.dart';
import 'package:medical_consultation/rcs/utils/constant.dart';
import 'package:readmore/readmore.dart';

class DoctorDetails extends StatelessWidget {
  const DoctorDetails({super.key, required this.doctorDetails});
  final Doctor doctorDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoctorSetailsWidget(doctorDetails: doctorDetails),
    );
  }
}

class DoctorSetailsWidget extends StatefulWidget {
  const DoctorSetailsWidget({super.key, required this.doctorDetails});
  final Doctor doctorDetails;
  @override
  State<DoctorSetailsWidget> createState() => _DoctorSetailsWidgetState();
}

class _DoctorSetailsWidgetState extends State<DoctorSetailsWidget> {
  late DateTime now = DateTime.now();
  late int selectedDay = 0;
  late int selectedTime = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.topCenter,
          image: AssetImage(AppImages().backgroundImg),
        ),
      ),
      child: SingleChildScrollView(
        child: doctorDetails(),
      ),
    );
  }

  Widget upperBgWithAppBar() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 15,
        ),
        child: Row(
          children: [
            InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                height: 35,
                width: 35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors().whiteColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(100)),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors().whiteColor,
                  size: 16,
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(right: 35),
                child: Text(
                  AppStrings.detailDoctor,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors().whiteColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget drProfileImg() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: DeviceMediaQuery(context).width * 0.25,
        width: DeviceMediaQuery(context).width * 0.25,
        padding: const EdgeInsets.all(3.0),
        margin: EdgeInsets.only(top: DeviceMediaQuery(context).height / 7),
        decoration: BoxDecoration(
          color: AppColors().whiteColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(widget.doctorDetails.img!),
        ),
      ),
    );
  }

  Widget doctorDetails() {
    return Stack(
      children: [
        Container(
          height: DeviceMediaQuery(context).height,
          width: DeviceMediaQuery(context).width,
          margin: EdgeInsets.only(top: DeviceMediaQuery(context).height / 6),
          padding: EdgeInsets.only(
            top: DeviceMediaQuery(context).height * 0.13,
            left: 15.0,
            right: 15.0,
          ),
          decoration: BoxDecoration(
            color: AppColors().whiteColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Text(
                widget.doctorDetails.doctorName!,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: AppColors().blackColor,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                widget.doctorDetails.specialist!,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors().greyColor,
                ),
              ),
              drStatics(),
              aboutDoctor(),
              selectDaySlot(),
              timeSlots(),
            ],
          ),
        ),
        upperBgWithAppBar(),
        drProfileImg(),
      ],
    );
  }

  Widget drStatics() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      decoration: BoxDecoration(
        color: AppColors().blueColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: staticWithDetails(
                label: AppStrings.drPatients,
                data: widget.doctorDetails.patients!.toString(),
              ),
            ),
            VerticalDivider(color: AppColors().greyColor),
            Expanded(
              child: staticWithDetails(
                label: AppStrings.drExp,
                isExp: true,
                data: widget.doctorDetails.experience!.toString(),
              ),
            ),
            VerticalDivider(color: AppColors().greyColor),
            Expanded(
              child: staticWithDetails(
                label: AppStrings.drRating,
                data: '${widget.doctorDetails.rating!}',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget staticWithDetails({
    required String label,
    required String data,
    bool? isExp = false,
  }) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors().greyColor,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              data,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors().blueColor,
              ),
            ),
            isExp!
                ? Text(
                    AppStrings.yrs,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: AppColors().blueColor,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ],
    );
  }

  Widget aboutDoctor() {
    return Column(
      children: [
        const LabelWithSeeAll(
          label: AppStrings.aboutDoctor,
          seeAllButton: false,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ReadMoreText(
            widget.doctorDetails.about!,
            trimLines: 3,
            trimMode: TrimMode.Line,
            trimCollapsedText: AppStrings.readMore,
            trimExpandedText: AppStrings.readLess,
            style: TextStyle(
              fontSize: 14,
              height: 1.7,
              color: AppColors().greyColor,
            ),
            moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors().blueColor,
            ),
            lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors().blueColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget selectDaySlot() {
    late DateTime lastDayOfMonth;
    lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: LabelWithSeeAll(
            label: AppStrings.selectSchedule,
            seeAllButton: false,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                lastDayOfMonth.day,
                (index) => GestureDetector(
                  onTap: () => setState(() => selectedDay = index),
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: selectedDay == index
                          ? AppColors().blueColor
                          : AppColors().blueColor.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: selectedDay == index
                          ? [
                              BoxShadow(
                                color: AppColors().blueColor,
                                offset: const Offset(0, 2.5),
                                blurRadius: 3,
                              ),
                            ]
                          : [],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        () {
                          final currentDate =
                              lastDayOfMonth.add(Duration(days: index + 1));

                          final dateName = DateFormat('E').format(currentDate);
                          return Text(
                            dateName,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: selectedDay == index
                                  ? AppColors().whiteColor
                                  : AppColors().greyColor,
                            ),
                          );
                        }(),
                        const SizedBox(height: 10),
                        Text(
                          "${index + 1}".padLeft(2, '0'),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: selectedDay == index
                                ? AppColors().whiteColor
                                : AppColors().blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget timeSlots() {
    TimeOfDay startTime = const TimeOfDay(hour: 8, minute: 0);
    TimeOfDay endTime = const TimeOfDay(hour: 22, minute: 0);
    Duration step = const Duration(hours: 1);
    final times = getTimes(startTime, endTime, step)
        .map((tod) => tod.format(context))
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.morning,
          style: TextStyle(color: AppColors().greyColor),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  times.length,
                  (index) => GestureDetector(
                    onTap: () => setState(() => selectedTime = index),
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      margin: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          color: selectedTime == index
                              ? AppColors().blueColor
                              : AppColors().blueColor.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: selectedTime == index
                              ? [
                                  BoxShadow(
                                    color: AppColors().blueColor,
                                    offset: const Offset(0, 2.5),
                                    blurRadius: 3,
                                  ),
                                ]
                              : []),
                      child: Text(
                        times[index],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: selectedTime == index
                              ? AppColors().whiteColor
                              : AppColors().blackColor,
                        ),
                      ),
                    ),
                  ),
                ).toList(),
              )),
        ),
      ],
    );
  }

  Iterable<TimeOfDay> getTimes(
      TimeOfDay startTime, TimeOfDay endTime, Duration step) sync* {
    var hour = startTime.hour;
    var minute = startTime.minute;

    do {
      yield TimeOfDay(hour: hour, minute: minute);
      minute += step.inMinutes;
      while (minute >= 60) {
        minute -= 60;
        hour++;
      }
    } while (hour < endTime.hour ||
        (hour == endTime.hour && minute <= endTime.minute));
  }
}
