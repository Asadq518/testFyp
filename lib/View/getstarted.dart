import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/View/bottom_nav_screen.dart';
import 'package:fyp/colors.dart';
import 'package:fyp/wigets/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';

class Start extends StatefulWidget {
  static const routeName = 'Start';
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundcolor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.asset('assets/images/start.png'),
            ),
            SizedBox(
              height: 45.h,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40,
                right: 25,
              ),
              child: Center(
                child: Text(
                  "The World’s most advancedpet community",
                  style: GoogleFonts.museoModerno(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff157a8c),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 65.h,
            ),
            CustomButton(
              text: "Get Started",
              onPressed: () {
                Navigator.of(context).pushNamed(BottomNavScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
