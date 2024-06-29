import 'package:chat_gpt_flutter/chat_gpt_flutter.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fyp/View/Sell_pets/sell_all_Pet.dart';
import 'package:fyp/View/chatbot/view/chat_screen.dart';

import 'package:fyp/View/services_cat/see_all_service_categories.dart';
import 'package:fyp/View/sell_all_screen.dart';
import 'package:fyp/View/sell_category_screen.dart';
import 'package:fyp/colors.dart';
import 'package:fyp/core/dummy_data/dummy_data.dart';
import 'package:fyp/provider/pet_post_provider/pet_provider.dart';
import 'package:fyp/wigets/custom_card.dart';
import 'package:fyp/wigets/custom_consultation_card.dart';
import 'package:fyp/wigets/custom_food_card.dart';
import 'package:fyp/wigets/custom_maintenance_card.dart';
import 'package:fyp/wigets/custom_missing_card.dart';
import 'package:fyp/wigets/custom_pet_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    var petProvider = context.read<PetProvider>();
    petProvider.fetchPets();
    petProvider.fetchMissingPets();
    petProvider.fetchHospitalPets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var petProvider = context.watch<PetProvider>();

    // ignore: unused_local_variable
    CurrencyFormat pkrSetting = const CurrencyFormat(
      code: 'pkr',
      symbol: 'Rs',
      symbolSide: SymbolSide.left,
      thousandSeparator: ',',
      decimalSeparator: '.',
      symbolSeparator: ' ',
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundcolor,
        elevation: 0,
        leading: InkWell(
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/svg/Bag.svg',
            ),
          ),
          onTap: () {},
        ),
        actions: [
          InkWell(
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/images/Sidep.png',
              ),
            ),
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/svg/Location.svg'),
            SizedBox(
              width: 10.w,
            ),
            const Text(
              "lahore Raiwind",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            )
          ],
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "ChatTag",
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ChatScreen()));
        },
        child: SvgPicture.asset("assets/svg/smsp.svg"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 18,
                right: 18,
                top: 24,
              ),
              child: TextField(
                onChanged: (value) {
                  // You can implement your logic here
                  Text('Searching: $value');
                },
                decoration: const InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      borderSide: BorderSide.none),

                  fillColor: Color.fromARGB(255, 230, 231,
                      232), // Add this line to customize the filled color
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
              ),
              child: Image.asset(
                'assets/images/ban.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Service Categories",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SellAllService()));
                    },
                    child: Text(
                      "See all",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff2f6a74),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  children: List.generate(
                    DummyData.categories.length,
                    (index) => MyCard(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SellCategoryScreen(
                              type: DummyData.categories[index].name!,
                              serviceCategory:
                                  DummyData.categories[index].serviceCategory,
                            ),
                          ),
                        );
                      },
                      category: DummyData.categories[index],
                      // height: 80,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pets",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff2f6a74),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SeeAllProducts(),
                        ),
                      );
                    },
                    child: Text(
                      "See All",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff2f6a74),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 15,
                ),
                child: Row(
                  children: List.generate(
                    petProvider.pets.length,
                    (index) => CustomPetCard(
                      pet: petProvider.pets[index],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pet Foods",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff2f6a74),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SellAllScreen(
                            category: 'Food',
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "See all",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff2f6a74),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 15,
                ),
                child: Row(
                  children: List.generate(
                    DummyData.food.length,
                    (index) => CustomFoodCard(
                      food: DummyData.food[index],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Loss Pets",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff2f6a74),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SeeAllMissingProducts(),
                        ),
                      );
                    },
                    child: Text(
                      "See all",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff2f6a74),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                  top: 15,
                ),
                child: Row(
                  children: List.generate(
                    petProvider.missingpets.length,
                    (index) => CustomMissingCard(
                      missing: petProvider.missingpets[index],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pet Maintenance",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff2f6a74),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SellAllScreen(
                            category: 'Maintenance',
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "See all",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff2f6a74),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 15,
                ),
                child: Row(
                    children: List.generate(
                  DummyData.maitenance.length,
                  (index) => CustomMaintenanceCard(
                    maintenance: DummyData.maitenance[index],
                  ),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pet Medical Consultation ",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff2f6a74),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SeeAllHospitalProducts(),
                        ),
                      );
                    },
                    child: Text(
                      "See all",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff2f6a74),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 15,
                ),
                child: Row(
                  children: List.generate(
                    petProvider.hospitalpets.length,
                    (index) => CustomConsultationCard(
                      consultation: petProvider.hospitalpets[index],
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                bottom: 65,
              ),
            )
          ],
        ),
      ),
    );
  }
}
