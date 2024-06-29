import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:fyp/View/add_screen_for_sell.dart';

import 'package:fyp/View/chat_screen.dart';
import 'package:fyp/View/home/home.dart';
import 'package:fyp/View/my_ads.screen.dart';
import 'package:fyp/View/post_categories_screen.dart';
import 'package:fyp/View/profile_screen.dart';
import 'package:fyp/View/sell_screen.dart';

class BottomNavScreen extends StatefulWidget {
  static const routeName = 'navbar';
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int index = 0;

  List<Widget> screens = [
    const Home(),
    const ChatScreen(),
    // const SellScreen(),
    const MyAdsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: FloatingActionButton(
          heroTag: "SellTag",
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PostCategoriesScreen()));
          },
          child: SvgPicture.asset(
            "assets/svg/Add.svg",
            height: 150.h,
          ),
        ),
      ),
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        selectedItemColor: const Color(0xff4E9AA8),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/svg/Home.svg"),
            label: "HOME",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/svg/chats.svg",
            ),
            label: "CHATS",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/svg/Ads.svg",
            ),
            label: "Ads",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/svg/Profile.svg",
            ),
            label: "PROFILE",
          ),
        ],
        onTap: (newIndex) {
          setState(() {
            index = newIndex;
          });
        },
      ),
    );
  }
}
