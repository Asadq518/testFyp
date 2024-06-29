import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fyp/View/edit_profile_screen.dart';
import 'package:fyp/View/favorites_screen.dart';
import 'package:fyp/View/help_support_screen.dart';
import 'package:fyp/View/order_and_billing_screen.dart';
import 'package:fyp/View/setting_screen.dart';
import 'package:fyp/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 5),
                  child: SvgPicture.asset(
                    "assets/svg/emoji.svg",
                    width: 120.w,
                    height: 120.h,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 70),
                      child: Text(
                        "James",
                        style: GoogleFonts.poppins(
                          // fontStyle: FontStyle.italic,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff034B56),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const EditScreen()));
                        },
                        child: Text(
                          "View and edit profile",
                          style: GoogleFonts.poppins(
                            // fontStyle: FontStyle.italic,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff034B56),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        width: 150.w,
                        child: const Divider(
                          color: Color(0xff86C6D0),
                          thickness: 1,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.favorite_border_outlined,
                    color: const Color(0xff034B56),
                    weight: 50.w,
                    size: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 3),
                          child: Text(
                            "Favorites & Saved searches",
                            style: GoogleFonts.poppins(
                              // fontStyle: FontStyle.italic,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff034B56),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: Text(
                            "All of your favorite ads & saved \n filters",
                            style: GoogleFonts.poppins(
                              // fontStyle: FontStyle.italic,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff0E6F7D),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const FavoritesScreen()));
                    },
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      size: 40,
                      color: Color(0xff034B56),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 18,
                right: 18,
                top: 5,
              ),
              child: Divider(
                color: Color(0xff86C6D0),
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Icon(
                    Icons.file_copy_outlined,
                    color: const Color(0xff034B56),
                    weight: 50.w,
                    size: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 2, top: 3),
                          child: Text(
                            "Oder and Billing Info",
                            style: GoogleFonts.poppins(
                              // fontStyle: FontStyle.italic,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff034B56),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Oder, billing and invoices",
                            style: GoogleFonts.poppins(
                              // fontStyle: FontStyle.italic,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff0E6F7D),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 72.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) => const BillingOrderScreen()),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      size: 40,
                      color: Color(0xff034B56),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 18, right: 18, top: 7),
              child: Divider(
                color: Color(0xff86C6D0),
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    color: const Color(0xff034B56),
                    weight: 50.w,
                    size: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 130, top: 3),
                          child: Text(
                            "Settings",
                            style: GoogleFonts.poppins(
                              // fontStyle: FontStyle.italic,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff034B56),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Privacy and manage account",
                            style: GoogleFonts.poppins(
                              // fontStyle: FontStyle.italic,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff0E6F7D),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 38.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          // ignore: prefer_const_constructors
                          builder: ((context) => SettingScreen())));
                    },
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      size: 40,
                      color: Color(0xff034B56),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 18, right: 18, top: 7),
              child: Divider(
                color: Color(0xff86C6D0),
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Icon(
                    Icons.question_mark,
                    color: const Color(0xff034B56),
                    weight: 50.w,
                    size: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 75, top: 3),
                          child: Text(
                            "Help & Support",
                            style: GoogleFonts.poppins(
                              // fontStyle: FontStyle.italic,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff034B56),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: Text(
                            "Help center and legal terms",
                            style: GoogleFonts.poppins(
                              // fontStyle: FontStyle.italic,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff0E6F7D),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 60.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HelpSupportScrren()));
                    },
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      size: 40,
                      color: Color(0xff034B56),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 18, right: 18, top: 7),
              child: Divider(
                color: Color(0xff86C6D0),
                thickness: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
