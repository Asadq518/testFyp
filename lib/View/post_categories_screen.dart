import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fyp/View/add_pet_hospital_screen.dart';
import 'package:fyp/View/missing_pet/add_pet_lost_screen.dart';
import 'package:fyp/View/adds_screen_for_sell/add_screen_for_sell.dart';

import 'package:fyp/colors.dart';
import 'package:fyp/wigets/custom_selection_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class PostCategoriesScreen extends StatefulWidget {
  const PostCategoriesScreen({super.key});

  @override
  State<PostCategoriesScreen> createState() => _PostCategoriesScreenState();
}

class _PostCategoriesScreenState extends State<PostCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundcolor,
        appBar: AppBar(
          backgroundColor: const Color(0xffE2EFF1),
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: SvgPicture.asset("assets/svg/back.svg"),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(
              right: 10,
            ),
            child: Text(
              "View All",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: const Color(
                  0xff034B56,
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            CategorySelection(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AddScreeeforsell()));
              },
              img: "assets/images/sell.png",
              name: "SELL",
              onPrssed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AddScreeeforsell()));
              },
            ),
            CategorySelection(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PetLostAddScreen(),
                    ),
                  );
                },
                img: "assets/images/LOST PET.png",
                name: "PET MISSING",
                onPrssed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PetLostAddScreen(),
                    ),
                  );
                }),
            CategorySelection(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PetHospitalAddScreen(),
                    ),
                  );
                },
                img: "assets/images/Medical.png",
                name: "PET Hospital",
                onPrssed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PetHospitalAddScreen(),
                    ),
                  );
                }),
          ],
        ));
  }
}
