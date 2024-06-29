import 'package:carousel_slider/carousel_slider.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:fyp/core/models/pet_medical_consultation_model.dart';

import 'package:google_fonts/google_fonts.dart';

class DeatilsScreenConsltation extends StatefulWidget {
  final PetConsultationModel conslutation;

  const DeatilsScreenConsltation({
    super.key,
    required this.conslutation,
  });

  @override
  State<DeatilsScreenConsltation> createState() =>
      _DeatilsScreenConsltationState();
}

class _DeatilsScreenConsltationState extends State<DeatilsScreenConsltation> {
  final CarouselController carouselController = CarouselController();
  int currentindex = 0;
  bool liked = false;
  CurrencyFormat pkrSetting = const CurrencyFormat(
    code: 'pkr',
    symbol: 'Rs',
    symbolSide: SymbolSide.left,
    thousandSeparator: ',',
    decimalSeparator: '.',
    symbolSeparator: ' ',
  );

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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                    ),
                    child: CarouselSlider(
                      items: List.generate(
                          widget.conslutation.images!.length,
                          (index) => AspectRatio(
                                aspectRatio: 16 / 9,
                                child: Image.network(
                                  widget.conslutation.images![index],
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
                          widget.conslutation.petName!,
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
                          widget.conslutation.category!,
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
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: Row(
                      children: [
                        Text(
                          'About Us ${widget.conslutation.hName}',
                          style: GoogleFonts.montserrat(
                            // fontStyle: FontStyle.italic,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff2f6a74),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 30),
                    child: Row(
                      children: [
                        Container(
                          width: 175.w,
                          height: 70.h,
                          // ignore: sort_child_properties_last
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/svg/location 1.svg",
                                  width: 30.w,
                                  height: 30.h,
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, top: 10),
                                      child: Text(
                                        "Area served",
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
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Text(
                                        widget.conslutation.location!,
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
                          width: 175.w,
                          height: 70.h,
                          // ignore: sort_child_properties_last
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/svg/happy prt.svg",
                                  width: 30,
                                  height: 30,
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 10),
                                      child: Text(
                                        "Fee",
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
                                        CurrencyFormatter.format(
                                          widget.conslutation.fee,
                                          pkrSetting,
                                        ),
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
                    padding: const EdgeInsets.only(left: 15, top: 25),
                    child: Row(
                      children: [
                        Container(
                          width: 175.w,
                          height: 70.h,
                          // ignore: sort_child_properties_last
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/svg/clock1.svg",
                                  width: 30,
                                  height: 30,
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        "Hours",
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
                                        widget.conslutation.hours!,
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
                          width: 175.w,
                          height: 70.h,
                          // ignore: sort_child_properties_last
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/svg/doctor.svg",
                                  width: 30,
                                  height: 30,
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, top: 10),
                                      child: Text(
                                        "Doctor",
                                        style: GoogleFonts.montserrat(
                                          // fontStyle: FontStyle.italic,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff4E9AA8),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        widget.conslutation.doctors!,
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
                      bottom: 90,
                      top: 20,
                    ),
                    child: Image.asset("assets/images/map.png"),
                  ),
                ],
              ),
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
