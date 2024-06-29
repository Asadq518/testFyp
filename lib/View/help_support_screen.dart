import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpSupportScrren extends StatefulWidget {
  const HelpSupportScrren({super.key});

  @override
  State<HelpSupportScrren> createState() => _HelpSupportScrrenState();
}

class _HelpSupportScrrenState extends State<HelpSupportScrren> {
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
                    padding: const EdgeInsets.only(right: 85, top: 20),
                    child: Text(
                      "Help Center",
                      style: GoogleFonts.poppins(
                        // fontStyle: FontStyle.italic,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff034B56),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Text(
                      "See FAQ and contact support",
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
                width: 80.w,
              ),

              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => const PrivacyScreen()));
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color(0xff034B56),
                    size: 40,
                  ),
                ),
              ),
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
                    padding: const EdgeInsets.only(right: 135, top: 20),
                    child: Text(
                      "Feedback",
                      style: GoogleFonts.poppins(
                        // fontStyle: FontStyle.italic,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff034B56),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Text(
                      "Take a moment to let us know how\n we're doing",
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
                width: 40.w,
              ),

              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => const PrivacyScreen()));
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color(0xff034B56),
                    size: 40,
                  ),
                ),
              ),
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
                    padding: const EdgeInsets.only(right: 20, top: 20),
                    child: Text(
                      "Invite friends to PET APP",
                      style: GoogleFonts.poppins(
                        // fontStyle: FontStyle.italic,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff034B56),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Text(
                      "Invite your friends to buy and sell",
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
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => const PrivacyScreen()));
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color(0xff034B56),
                    size: 40,
                  ),
                ),
              ),
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
