import 'package:carousel_slider/carousel_slider.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fyp/core/models/pet_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class DeatilScreen extends StatefulWidget {
  final PetModel pet;

  const DeatilScreen({
    super.key,
    required this.pet,
  });

  @override
  State<DeatilScreen> createState() => _DeatilScreenState();
}

class _DeatilScreenState extends State<DeatilScreen> {
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
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios_new_outlined,
                color: Colors.white),
          ),
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
                          widget.pet.images!.length,
                          (index) => AspectRatio(
                                aspectRatio: 16 / 9,
                                child: Image.network(
                                  widget.pet.images![index],
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
                          widget.pet.name!,
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
                        Text(
                          CurrencyFormatter.format(
                            widget.pet.price,
                            pkrSetting,
                          ),
                          style: GoogleFonts.montserrat(
                            // fontStyle: FontStyle.italic,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff2f6a74),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: Row(
                      children: [
                        Text(
                          widget.pet.breed!,
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
                          "About  ${widget.pet.title!} ",
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
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    // ignore: avoid_unnecessary_containers
                    child: Container(
                      child: Text(
                        widget.pet.description!,
                        style: GoogleFonts.montserrat(
                          // fontStyle: FontStyle.italic,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff2f6a74),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 30),
                    child: Row(
                      children: [
                        Container(
                          width: 160.w,
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
                                        "Month",
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
                                        widget.pet.age!,
                                        // "12",
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
                                        widget.pet.weight!,
                                        // "13",
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
                          width: 160.w,
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
                                  width: 30.w,
                                  height: 30.h,
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 0, top: 10),
                                      child: Text(
                                        "Breed",
                                        style: GoogleFonts.montserrat(
                                          // fontStyle: FontStyle.italic,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff4E9AA8),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 0),
                                      child: Text(
                                        widget.pet.breed!,
                                        style: GoogleFonts.montserrat(
                                          // fontStyle: FontStyle.italic,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
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
                          width: 155,
                          height: 69,
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
                                        // widget.pet.sex!,
                                        "male",
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
                      width: 164.w,
                      height: 69.h,
                      // ignore: sort_child_properties_last
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/svg/vac.svg",
                              width: 30.w,
                              height: 30.h,
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, top: 10),
                                  child: Text(
                                    "Vaccination",
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
                                    // widget.pet.vaccination!,
                                    "yes",
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
                      bottom: 20,
                      top: 20,
                    ),
                    child: Image.asset("assets/images/map.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 125),
                    child: Text(
                      "About Your Safety!",
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff157A8C),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Only meet in public / crowded places.",
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff157A8C),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Never go alone to meet a buyer / seller,always take someone with you.",
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff157A8C),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Check and inspect the pet properly, before purchasing it.",
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff157A8C),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Check and inspect the pet properly,   before purchasing it.",
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff157A8C),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Never pay anything in advance or transfer money before inspecting the product.",
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff157A8C),
                          ),
                        ),
                      ],
                    ),
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
                      onTap: () async {
                        // ignore: deprecated_member_use
                        if (await canLaunch('tel:${widget.pet.number}')) {
                          // ignore: deprecated_member_use
                          await launch('tel:${widget.pet.number}');
                        } else {
                          throw 'Could not launch ${widget.pet.number}';
                        }
                      },
                      child: SvgPicture.asset("assets/svg/CALL.svg"),
                    ),
                    InkWell(
                      onTap: () async {
                        // ignore: deprecated_member_use
                        if (await canLaunch('sms:${widget.pet.number}')) {
                          await launch('sms:${widget.pet.number}');
                        } else {
                          throw 'Could not launch SMS app';
                        }
                      },
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
