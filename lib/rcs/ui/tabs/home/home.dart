import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_consultation/rcs/model/doctors_model.dart';
import 'package:medical_consultation/rcs/ui/tabs/home/doctor_details.dart';
import 'package:medical_consultation/rcs/ui/tabs/home/widget/card_stack_widget.dart';
import 'package:medical_consultation/rcs/ui/tabs/home/widget/doctor_details_card.dart';
import 'package:medical_consultation/rcs/ui/tabs/home/widget/label_with_see_all.dart';
import 'package:medical_consultation/rcs/utils/app_colors.dart';
import 'package:medical_consultation/rcs/utils/app_strings.dart';
import 'package:medical_consultation/rcs/utils/constant.dart';
import 'package:medical_consultation/rcs/widgets/common_textfield.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeWidgets();
  }
}

class HomeWidgets extends StatefulWidget {
  const HomeWidgets({super.key});

  @override
  State<HomeWidgets> createState() => _HomeWidgetsState();
}

class _HomeWidgetsState extends State<HomeWidgets> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (_) => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: Column(
            children: [
              userNameAndProfile(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: CommonSearchTextField(
                  hintText: AppStrings.searchHereHint,
                  controller: _searchController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    categoryItem(
                      icondata: CupertinoIcons.building_2_fill,
                      iconColor: Colors.red,
                      label: AppStrings.hospital,
                    ),
                    categoryItem(
                      icondata: CupertinoIcons.waveform_path_badge_plus,
                      iconColor: Colors.blue,
                      label: AppStrings.consultant,
                    ),
                    categoryItem(
                      icondata: CupertinoIcons.calendar_badge_plus,
                      iconColor: Colors.yellow,
                      label: AppStrings.receipe,
                    ),
                    categoryItem(
                      icondata: Icons.store_mall_directory_rounded,
                      iconColor: Colors.green,
                      label: AppStrings.appointment,
                    ),
                  ],
                ),
              ),
              LabelWithSeeAll(
                label: AppStrings.appointmentToday,
                seeAllButton: true,
                onPressedSeeAll: () {},
              ),
              const CardStack(),
              LabelWithSeeAll(
                label: AppStrings.topDoctorsForYou,
                seeAllButton: true,
                onPressedSeeAll: () {},
              ),
              doctorsList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget userNameAndProfile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.helloText,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors().blackColor,
              ),
            ),
            Text(
              AppStrings.howDoYouFeelToday,
              style: TextStyle(
                color: AppColors().greyColor,
              ),
            ),
          ],
        ),
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(drImages[0]),
            ),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ],
    );
  }

  Widget categoryItem(
      {required IconData icondata,
      required Color iconColor,
      required String label}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            height: 50,
            width: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors().whiteColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(
              icondata,
              color: iconColor,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          style: TextStyle(
            fontSize: 12,
            color: AppColors().greyColor,
          ),
        ),
      ],
    );
  }

  Widget doctorsList() {
    final Doctors doctorList = Doctors.fromJson(doctorJson);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: doctorList.doctors!.length,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(0),
      itemBuilder: (context, index) {
        final Doctor doctor = doctorList.doctors![index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DoctorDetails(doctorDetails: doctor),
            ),
          ),
          child: DoctorDetailsCard(doctorDetails: doctor),
        );
      },
    );
  }
}
