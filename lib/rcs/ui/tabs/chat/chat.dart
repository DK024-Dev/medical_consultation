import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_consultation/rcs/model/chat_model.dart';
import 'package:medical_consultation/rcs/ui/tabs/chat/widget/doctor_chat_card.dart';
import 'package:medical_consultation/rcs/utils/app_colors.dart';
import 'package:medical_consultation/rcs/utils/app_images.dart';
import 'package:medical_consultation/rcs/utils/app_strings.dart';
import 'package:medical_consultation/rcs/utils/constant.dart';
import 'package:medical_consultation/rcs/widgets/common_textfield.dart';

class ChatTab extends StatelessWidget {
  const ChatTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const ChatWidgets();
  }
}

class ChatWidgets extends StatefulWidget {
  const ChatWidgets({super.key});

  @override
  State<ChatWidgets> createState() => _ChatWidgetsState();
}

class _ChatWidgetsState extends State<ChatWidgets> {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.chat,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: AppColors().blackColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz_rounded),
                  ),
                ],
              ),
              searchFieldWithEditButton(),
              chat(),
            ],
          ),
        ),
      ),
    );
  }

  Widget searchFieldWithEditButton() {
    return Row(
      children: [
        Expanded(
          child: CommonSearchTextField(
            hintText: AppStrings.searchHereHint,
            controller: _searchController,
          ),
        ),
        Container(
          height: 45,
          width: 45,
          margin: const EdgeInsets.only(left: 10),
          padding: const EdgeInsets.all(13.0),
          decoration: BoxDecoration(
            color: AppColors().whiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(AppImages().edit),
        )
      ],
    );
  }

  Widget chat() {
    final ChatList chats = ChatList.fromJson(chatListJson);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: chats.doctorsChat!.length,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 15),
      itemBuilder: (context, index) {
        final DoctorsChat doctorChat = chats.doctorsChat![index];
        return DoctorChatCard(doctorsChat: doctorChat);
      },
    );
  }
}
