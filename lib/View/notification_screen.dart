import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isActive = false;
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
          "Notifications",
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
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 80),
                      child: Text(
                        "Recommendations",
                        style: GoogleFonts.poppins(
                          // fontStyle: FontStyle.italic,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff034B56),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "Receive recommendations based\non your activity",
                      style: GoogleFonts.poppins(
                        // fontStyle: FontStyle.italic,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff034B56),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 10),
                child: Transform.scale(
                  scale: 1.2,
                  child: Switch(
                    value: isActive,
                    onChanged: (value) {
                      setState(() {
                        isActive = value;
                      });
                    },
                    activeThumbImage:
                        const AssetImage("assets/images/tick.png"),
                    // ignore: prefer_const_constructors
                    activeColor: Color.fromARGB(255, 181, 222, 228),
                    inactiveThumbColor:
                        const Color.fromARGB(255, 178, 199, 202),
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
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 26),
                      child: Text(
                        "Special communications &\noffers",
                        style: GoogleFonts.poppins(
                          // fontStyle: FontStyle.italic,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff034B56),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "Receive updates, offers, surveys and\nmore",
                      style: GoogleFonts.poppins(
                        // fontStyle: FontStyle.italic,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff034B56),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 10),
                child: Transform.scale(
                  scale: 1.2,
                  child: Switch(
                    value: isActive,
                    onChanged: (value) {
                      setState(() {
                        isActive = value;
                      });
                    },
                    activeThumbImage:
                        const AssetImage("assets/images/tick.png"),
                    // ignore: prefer_const_constructors
                    activeColor: Color.fromARGB(255, 181, 222, 228),
                    inactiveThumbColor:
                        const Color.fromARGB(255, 178, 199, 202),
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
        ],
      ),
    );
  }
}
