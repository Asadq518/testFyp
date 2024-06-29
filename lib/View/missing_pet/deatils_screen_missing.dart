import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fyp/core/models/pet_missing_model.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DeatilsScreenMissing extends StatefulWidget {
  final PetMissingModel missing;

  const DeatilsScreenMissing({
    super.key,
    required this.missing,
  });

  @override
  State<DeatilsScreenMissing> createState() => _DeatilsScreenMissingState();
}

class _DeatilsScreenMissingState extends State<DeatilsScreenMissing> {
  final CarouselController carouselController = CarouselController();
  int currentindex = 0;
  bool liked = false;
  DateFormat dateformater = DateFormat();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        // backgroundColor: backgroundcolor,
        appBar: AppBar(
          // forceMaterialTransparency: true,
          // elevation: 0,
          backgroundColor: const Color(0xff157A8C),
          leading: const Icon(Icons.arrow_back_ios_new_outlined,
              color: Colors.white),
          actions: [
            InkWell(
              onTap: () {},
              child: SvgPicture.asset("assets/svg/fav.svg"),
            ),
            SizedBox(
              width: 15.w,
            ),
            InkWell(
              onTap: () {},
              child: SvgPicture.asset("assets/svg/share.svg"),
            ),
            SizedBox(
              width: 15.w,
            )
          ],
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                  ),
                  child: CarouselSlider(
                    items: List.generate(
                        widget.missing.images!.length,
                        (index) => AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Image.network(
                                widget.missing.images![index],
                                fit: BoxFit.cover,
                              ),
                            )),
                    options: CarouselOptions(
                      viewportFraction: 1,
                      padEnds: false,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Row(
                    children: [
                      Text(
                        widget.missing.status ?? 'Active',
                        style: GoogleFonts.montserrat(
                          // fontStyle: FontStyle.italic,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Row(
                    children: [
                      Text(
                        widget.missing.petName!,
                        style: GoogleFonts.montserrat(
                          // fontStyle: FontStyle.italic,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 45.w,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Row(
                    children: [
                      Text(
                        widget.missing.category!,
                        style: GoogleFonts.montserrat(
                          // fontStyle: FontStyle.italic,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff2f6a74),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 30),
                  child: Row(
                    children: [
                      Container(
                        width: 155.w,
                        height: 69.h,
                        // ignore: sort_child_properties_last
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/svg/age.svg",
                                width: 40.w,
                                height: 40.h,
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30, top: 10),
                                    child: Text(
                                      "Age",
                                      style: GoogleFonts.montserrat(
                                        // fontStyle: FontStyle.italic,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff4E9AA8),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      widget.missing.age!,
                                      style: GoogleFonts.montserrat(
                                        // fontStyle: FontStyle.italic,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff034B56),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromARGB(255, 211, 237, 243),
                        ),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Container(
                        width: 155.w,
                        height: 69.h,
                        // ignore: sort_child_properties_last
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/svg/weight.svg",
                                width: 40.w,
                                height: 40.h,
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 10),
                                    child: Text(
                                      "Weight",
                                      style: GoogleFonts.montserrat(
                                        // fontStyle: FontStyle.italic,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff4E9AA8),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      widget.missing.weight!,
                                      style: GoogleFonts.montserrat(
                                        // fontStyle: FontStyle.italic,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff034B56),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromARGB(255, 211, 237, 243),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 25),
                  child: Row(
                    children: [
                      Container(
                        width: 155.w,
                        height: 69.h,
                        // ignore: sort_child_properties_last
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/svg/breed.svg",
                                width: 40.w,
                                height: 40.h,
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 10),
                                    child: Text(
                                      "Breed",
                                      style: GoogleFonts.montserrat(
                                        // fontStyle: FontStyle.italic,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff4E9AA8),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      widget.missing.breed!,
                                      style: GoogleFonts.montserrat(
                                        // fontStyle: FontStyle.italic,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff034B56),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromARGB(255, 211, 237, 243),
                        ),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Container(
                        width: 155.w,
                        height: 69.h,
                        // ignore: sort_child_properties_last
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/svg/sex.svg",
                                width: 35.w,
                                height: 35.h,
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 10),
                                    child: Text(
                                      "Sex",
                                      style: GoogleFonts.montserrat(
                                        // fontStyle: FontStyle.italic,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff4E9AA8),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      widget.missing.sex!,
                                      style: GoogleFonts.montserrat(
                                        // fontStyle: FontStyle.italic,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff034B56),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromARGB(255, 211, 237, 243),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Container(
                    width: 160.w,
                    height: 69.h,
                    // ignore: sort_child_properties_last
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.access_time_outlined,
                            color: Color(0xff0E6F7D),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, top: 10),
                                child: Text(
                                  "Last Seen",
                                  style: GoogleFonts.montserrat(
                                    // fontStyle: FontStyle.italic,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff4E9AA8),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    // Text(
                                    //   DateFormat('EEEE ', 'en_us')
                                    //       .format(widget.missing.lastseen!),
                                    //   style: GoogleFonts.montserrat(
                                    //     // fontStyle: FontStyle.italic,
                                    //     fontSize: 16,
                                    //     fontWeight: FontWeight.w600,
                                    //     color: const Color(0xff034B56),
                                    //   ),
                                    // ),
                                    Text(
                                      widget.missing.lseen!
                                      // DateFormat.MMMEd('en_US')
                                      //     .format(widget.missing.lastseen!)
                                      ,
                                      style: GoogleFonts.montserrat(
                                        // fontStyle: FontStyle.italic,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff034B56),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 211, 237, 243),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25, top: 20),
                      child: Text(
                        "Area",
                        style: GoogleFonts.montserrat(
                          // fontStyle: FontStyle.italic,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff034B56),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 90, top: 10),
                  child: Text(
                    "Satellite Town, Christian Sharif\nLahore",
                    style: GoogleFonts.montserrat(
                      // fontStyle: FontStyle.italic,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff157A8C),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 100,
                    top: 20,
                  ),
                  child: Image.asset("assets/images/map.png"),
                ),
              ]),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset("assets/svg/CALL.svg"),
                    ),
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset("assets/svg/SMS3.svg"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
