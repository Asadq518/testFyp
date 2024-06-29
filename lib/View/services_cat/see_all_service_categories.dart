import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fyp/View/sell_category_screen.dart';
import 'package:fyp/colors.dart';
import 'package:fyp/wigets/custom_selection_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class SellAllService extends StatefulWidget {
  const SellAllService({super.key});

  @override
  State<SellAllService> createState() => _SellAllServiceState();
}

class _SellAllServiceState extends State<SellAllService> {
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SellCategoryScreen(
                        // type: DummyData.categories[index].name!,
                        // serviceCategory: ServiceCategory.food,
                        ),
                  ),
                );
              },
              img: "assets/images/sell.png",
              name: "SELL",
            ),
            CategorySelection(
              onTap: () {},
              img: "assets/images/FOOD.png",
              name: "FOOD",
            ),
            CategorySelection(
              onTap: () {},
              img: "assets/images/Maintenance.png",
              name: "Maintenance",
            ),
            CategorySelection(
              onTap: () {},
              img: "assets/images/LOST PET.png",
              name: "LOST PET",
            ),
            CategorySelection(
              onTap: () {},
              name: "Medical",
              img: "assets/images/Medical.png",
            )
          ],
        ));
  }
}
