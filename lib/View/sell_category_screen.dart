import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fyp/View/sell_all_screen.dart';
import 'package:fyp/colors.dart';
import 'package:fyp/core/dummy_data/dummy_data.dart';
import 'package:fyp/core/dummy_data/enums.dart';
import 'package:fyp/core/models/pet_model.dart';
import 'package:fyp/wigets/custom_selection_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class SellCategoryScreen extends StatefulWidget {
  final ServiceCategory? serviceCategory;
  final String? type;
  const SellCategoryScreen({super.key, this.type, this.serviceCategory});

  @override
  State<SellCategoryScreen> createState() => _SellCategoryScreenState();
}

class _SellCategoryScreenState extends State<SellCategoryScreen> {
  List<PetModel> allPets = DummyData.pets;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        backgroundColor: const Color(0xffE2EFF1),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset("assets/svg/back.svg"),
        ),
        title: Text(
          "All ${widget.serviceCategory!.name} Categories",
          style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: const Color(0xff034B56)),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 15,
              left: 12,
              right: 12,
            ),
          ),
          CategorySelection(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SellAllScreen(
                  serviceCategory: widget.serviceCategory!,
                  category: 'Dogs',
                ),
              ));
            },
            name: "Dogs",
            img: "assets/images/cd.png",
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 12,
              right: 12,
            ),
          ),
          CategorySelection(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SellAllScreen(
                  serviceCategory: widget.serviceCategory!,
                  category: 'Cats',
                ),
              ));
            },
            name: "Cat",
            img: "assets/images/Cd1.png",
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 12,
              right: 12,
            ),
          ),
          CategorySelection(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SellAllScreen(
                    serviceCategory: widget.serviceCategory!,
                    category: 'Rabbits',
                  ),
                ),
              );
            },
            name: "Rabbits",
            img: "assets/images/cd2.png",
          ),
        ],
      ),
    );
  }
}
