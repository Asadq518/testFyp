import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/View/manage_acount_screen.dart';
import 'package:fyp/View/notification_screen.dart';
import 'package:fyp/View/privacy_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 142, 199, 207),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff034B56),
          ),
        ),
        title: Text(
          "Setting",
          style: GoogleFonts.poppins(
            // fontStyle: FontStyle.italic,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xff034B56),
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 65, top: 20),
                    child: Text(
                      "Privacy",
                      style: GoogleFonts.poppins(
                        // fontStyle: FontStyle.italic,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff034B56),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 10),
                    child: Text(
                      "Phone number visibility",
                      style: GoogleFonts.poppins(
                        // fontStyle: FontStyle.italic,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff034B56),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 120.w,
              ),

              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PrivacyScreen()));
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color(0xff034B56),
                    size: 40,
                  ),
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Divider(
              color: Colors.black,
              thickness: 1,
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 80, top: 20),
                    child: Text(
                      "Notifications",
                      style: GoogleFonts.poppins(
                        // fontStyle: FontStyle.italic,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff034B56),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 10),
                    child: Text(
                      "Recommendations and special\n communication",
                      style: GoogleFonts.poppins(
                        // fontStyle: FontStyle.italic,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff034B56),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 55.w,
              ),

              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const NotificationScreen()));
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color(0xff034B56),
                    size: 40,
                  ),
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Divider(
              color: Color(0xff86C6D0),
              thickness: 1,
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6, top: 20),
                    child: Text(
                      "Manage account",
                      style: GoogleFonts.poppins(
                        // fontStyle: FontStyle.italic,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff034B56),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 10),
                    child: Text(
                      "Take action on account",
                      style: GoogleFonts.poppins(
                        // fontStyle: FontStyle.italic,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff034B56),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 115.w,
              ),

              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ManageAccountScreen()));
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color(0xff034B56),
                    size: 40,
                  ),
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Divider(
              color: Color(0xff86C6D0),
              thickness: 1,
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 10),
                    child: Text(
                      "Address Information",
                      style: GoogleFonts.poppins(
                        // fontStyle: FontStyle.italic,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff034B56),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 10),
                    child: Text(
                      "Edit your Address Information.",
                      style: GoogleFonts.poppins(
                        // fontStyle: FontStyle.italic,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff034B56),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 65.w,
              ),

              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xff034B56),
                  size: 40,
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Divider(
              color: Color(0xff86C6D0),
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
