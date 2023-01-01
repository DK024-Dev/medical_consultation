import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_consultation/rcs/ui/tabs/chat/chat.dart';
import 'package:medical_consultation/rcs/ui/tabs/home/home.dart';
import 'package:medical_consultation/rcs/utils/app_colors.dart';

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({super.key});

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  late int selectedIndex = 0;

  final List<Widget> widgetOptions = const <Widget>[
    HomeTab(),
    SizedBox(),
    SizedBox(),
    ChatTab(),
    SizedBox(),
  ];

  final List<BottomNavigationBarItem> _items = const [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.house),
      activeIcon: Icon(CupertinoIcons.house_fill),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.square_list),
      activeIcon: Icon(CupertinoIcons.square_list_fill),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add_rounded),
      activeIcon: Icon(Icons.add_rounded),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.chat_bubble),
      activeIcon: Icon(CupertinoIcons.chat_bubble_fill),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.settings),
      activeIcon: Icon(CupertinoIcons.settings_solid),
      label: '',
    ),
  ];

  Future onItemTapped(int index) async => setState(() => selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: widgetOptions.elementAt(selectedIndex)),
      backgroundColor: AppColors().accentGreyColor,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomNavigationBar(
          elevation: 10,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: AppColors().whiteColor,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(color: AppColors().blueColor),
          unselectedIconTheme: IconThemeData(color: AppColors().greyColor),
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          items: _items,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(bottom: 5),
        child: FloatingActionButton(
          mini: true,
          backgroundColor: AppColors().blueColor,
          // splashColor: AppColors().blueColor,
          child: const Icon(Icons.add_rounded),
          onPressed: () {},
        ),
      ),
    );
  }
}
