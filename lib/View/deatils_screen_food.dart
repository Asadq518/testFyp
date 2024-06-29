import 'package:carousel_slider/carousel_slider.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fyp/View/address_screen.dart';

import 'package:fyp/core/models/food_model.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodDeatilsScreen extends StatefulWidget {
  final FoodModel food;

  const FoodDeatilsScreen({
    super.key,
    required this.food,
  });

  @override
  State<FoodDeatilsScreen> createState() => _FoodDeatilsScreenState();
}

class _FoodDeatilsScreenState extends State<FoodDeatilsScreen> {
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
        leading:
            const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
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
                  padding: const EdgeInsets.only(top: 10),
                  child: Image.asset(widget.food.foodImage!),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 220),
                  child: Text(
                    CurrencyFormatter.format(
                      widget.food.price,
                      pkrSetting,
                    ),
                    style: GoogleFonts.montserrat(
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff2f6a74),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 27),
                  child: Row(
                    children: [
                      Text(
                        widget.food.foodName!,
                        style: GoogleFonts.montserrat(
                          // fontStyle: FontStyle.italic,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28),
                  child: Row(
                    children: [
                      Text(
                        widget.food.category!,
                        style: GoogleFonts.montserrat(
                          // fontStyle: FontStyle.italic,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff2f6a74),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 100.h,
                  color: const Color.fromARGB(255, 224, 234, 236),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Row(
                            children: [
                              Text(
                                // widget.pet.title!,
                                "Details",
                                style: GoogleFonts.montserrat(
                                  // fontStyle: FontStyle.italic,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Row(
                            children: [
                              Text(
                                // widget.pet.title!,
                                "Condition:",
                                style: GoogleFonts.montserrat(
                                  // fontStyle: FontStyle.italic,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff2f6a74),
                                ),
                              ),
                              SizedBox(
                                width: 30.w,
                              ),
                              Text(
                                // widget.pet.title!,
                                "New",
                                style: GoogleFonts.montserrat(
                                  // fontStyle: FontStyle.italic,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff2f6a74),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 180),
                  child: Text(
                    // widget.pet.title!,
                    "Description",
                    style: GoogleFonts.montserrat(
                      // fontStyle: FontStyle.italic,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff2f6a74),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 29, top: 20, bottom: 70, right: 20),
                  // ignore: avoid_unnecessary_containers
                  child: Container(
                    child: Text(
                      // widget.pet.description!,

                      widget.food.desperciption!,

                      style: GoogleFonts.montserrat(
                          // fontStyle: FontStyle.italic,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff2f6a74)),
                    ),
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
                    onTap: () {},
                    child: SvgPicture.asset("assets/svg/Addtocart.svg"),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              AddressScreen(food: widget.food)));
                    },
                    child: SvgPicture.asset("assets/svg/buynow.svg"),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
