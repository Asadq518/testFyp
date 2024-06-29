import 'package:currency_formatter/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/View/deatils_screen_food.dart';
import 'package:fyp/core/models/food_model.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFoodCard extends StatefulWidget {
  final FoodModel food;

  final Function()? onTap;
  const CustomFoodCard({
    super.key,
    this.onTap,
    required this.food,
  });

  @override
  State<CustomFoodCard> createState() => _CustomFoodCardState();
}

class _CustomFoodCardState extends State<CustomFoodCard> {
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
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FoodDeatilsScreen(food: widget.food)));
      },
      child: Card(
        color: const Color(0xffF0F5F6),
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          //set border radius more than 50% of height and width to make circle
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
              ),
              child: Container(
                height: 150.w,
                width: 150.h,
                decoration: const BoxDecoration(),
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Image.asset(widget.food.foodImage!)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          onPressed: () {
                            liked = !liked;
                            setState(() {});
                          },
                          icon: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: liked
                                ? const Icon(
                                    Icons.favorite,
                                    color: Color(
                                      0xff2f6a74,
                                    ),
                                  )
                                : const Icon(
                                    Icons.favorite_border_outlined,
                                    color: Color(0xff2f6a74),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 25,
                top: 7,
              ),
              child: Text(widget.food.foodName!,
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 25,
                top: 7,
              ),
              child: Text(
                widget.food.category!,
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff2f6a74),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 90,
                top: 7,
                bottom: 10,
              ),
              child: Text(
                CurrencyFormatter.format(
                  widget.food.price,
                  pkrSetting,
                ),
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
