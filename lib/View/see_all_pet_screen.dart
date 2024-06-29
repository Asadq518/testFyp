import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fyp/colors.dart';
import 'package:fyp/core/models/pet_model.dart';
import 'package:google_fonts/google_fonts.dart';

class SeeAllPetScreen extends StatefulWidget {
  final List<PetModel>? pets;
  const SeeAllPetScreen({
    super.key,
    this.pets,
  });

  @override
  State<SeeAllPetScreen> createState() => _SeeAllPetScreenState();
}

class _SeeAllPetScreenState extends State<SeeAllPetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundcolor,
        elevation: 0,
        leadingWidth: 17,
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 10,
          ),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xff034B56),
              size: 30,
            ),
          ),
        ),
        centerTitle: true,
        title: TextField(
          onChanged: (value) {
            // You can implement your logic here
            Text('Searching: $value');
          },
          decoration: const InputDecoration(
            hintStyle: TextStyle(
              fontSize: 15,
              color: Color(
                0xff034B56,
              ),
            ),
            hintText: 'What are you looking for?',

            prefixIcon: Icon(
              Icons.search,
              color: Color(0xff034B56),
              size: 40,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(22)),
              borderSide: BorderSide.none,
            ),

            fillColor: Color(
                0xffE2EFF1), // Add this line to customize the filled color
            filled: true,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 20,
              bottom: 20,
            ),
            child: Row(
              children: [
                Container(
                  width: 132.w,
                  height: 51.h,
                  // ignore: sort_child_properties_last
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/svg/Filter.svg",
                        ),
                      ),
                      Text(
                        "Pets",
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    // ignore: prefer_const_constructors
                    color: Color(0xff157a8c),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Container(
                  width: 160,
                  height: 51,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: const Color(
                      0xffe2eff1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 29,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Johar Town",
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff157A8C),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
              left: 15,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Showing: Results For Pets",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff2f6a74),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "Short By",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff2f6a74),
                    ),
                  ),
                ),
                SvgPicture.asset("assets/svg/sorted.svg")
              ],
            ),
          ),
          // Wrap(
          //   children: List.generate(
          //       widget.pets.length,
          //       (index) => CustomPetCard(
          //         pet: widget.pets[index],
          //       ),

          // ),
        ],
      ),
    );
  }
}
