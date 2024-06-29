import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fyp/colors.dart';
import 'package:fyp/core/dummy_data/dummy_data.dart';
import 'package:fyp/core/dummy_data/enums.dart';
import 'package:fyp/core/models/food_model.dart';
import 'package:fyp/core/models/pet_maintenance_model.dart';
import 'package:fyp/core/models/pet_medical_consultation_model.dart';
import 'package:fyp/core/models/pet_missing_model.dart';
import 'package:fyp/core/models/pet_model.dart';
import 'package:fyp/provider/pet_post_provider/pet_provider.dart';
import 'package:fyp/wigets/custom_consultation_card.dart';
import 'package:fyp/wigets/custom_food_card.dart';
import 'package:fyp/wigets/custom_maintenance_card.dart';
import 'package:fyp/wigets/custom_missing_card.dart';
import 'package:fyp/wigets/custom_pet_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SellAllScreen extends StatefulWidget {
  final String? category;
  final ServiceCategory? serviceCategory;
  const SellAllScreen({super.key, this.category, this.serviceCategory});

  @override
  State<SellAllScreen> createState() => _SellAllScreenState();
}

class _SellAllScreenState extends State<SellAllScreen> {
  List<PetModel> pets = [];
  List<FoodModel> foods = DummyData.food;
  List<PetMaintenanceModel> maintenances = DummyData.maitenance;
  List<PetMissingModel> missing = DummyData.missing;
  List<PetConsultationModel> consultation = DummyData.consultation;

  List<FoodModel> finalFood = [];
  List<PetModel> finalPets = [];
  List<PetMaintenanceModel> finalmaintenances = [];
  List<PetMissingModel> finalmissing = [];
  List<PetConsultationModel> finalconsultation = [];

  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    for (var item in foods) {
      if (item.category == widget.category) {
        finalFood.add(item);
      }
    }

    var petProvider = context.read<PetProvider>();
    petProvider.fetchPets();
    super.initState();

    for (var item in maintenances) {
      if (item.category == widget.category) {
        finalmaintenances.add(item);
      }
    }
    for (var item in missing) {
      if (item.category == widget.category) {
        finalmissing.add(item);
      }
    }
    for (var item in consultation) {
      if (item.category == widget.category) {
        finalconsultation.add(item);
      }
    }
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var petProvider = context.watch<PetProvider>();
    var filteredPetFoods = DummyData.food.where((pet) {
      return pet.foodName!.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
    var filteredPetLoss = DummyData.missing.where((pet) {
      return pet.petName!.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
    var finalfilteredPetFoods = finalFood.where((pet) {
      return pet.foodName!.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
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
              Navigator.pop(context);
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
          // onChanged: (value) {
          //   // You can implement your logic here
          //   Text('Searching: $value');
          // },
          controller: _searchController,
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
              size: 45,
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
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: InkWell(
        onTap: () {},
        child: Image.asset(
          'assets/images/save.png',
          width: 100.w,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: Column(
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
                            widget.category!,
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
                    SizedBox(
                      width: 35.w,
                    ),
                    Container(
                      width: 160.w,
                      height: 51.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: const Color(
                          0xffe2eff1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 25,
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
                      "Showing: Results for ${widget.category}",
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
                        "Sort By",
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
              (widget.serviceCategory == ServiceCategory.sell)
                  ? FutureBuilder(
                      future: petProvider.fetchPets(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Wrap(
                            children: List.generate(
                              petProvider.pets.length,
                              (index) => CustomPetCard(
                                pet: petProvider.pets[index],
                              ),
                            ),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    )
                  : (widget.serviceCategory == ServiceCategory.food)
                      ? Wrap(
                          children: List.generate(
                            finalfilteredPetFoods.length,
                            (index) => CustomFoodCard(
                              food: finalfilteredPetFoods[index],
                            ),
                          ),
                        )
                      : (widget.serviceCategory == ServiceCategory.maintenance)
                          ? Wrap(
                              children: List.generate(
                                finalmaintenances.length,
                                (index) => CustomMaintenanceCard(
                                  maintenance: finalmaintenances[index],
                                ),
                              ),
                            )
                          : (widget.serviceCategory == ServiceCategory.petloss)
                              ? Wrap(
                                  children: List.generate(
                                    petProvider.missingpets.length,
                                    (index) => CustomMissingCard(
                                      missing: petProvider.missingpets[index],
                                    ),
                                  ),
                                )

                              // Wrap(
                              //     children: List.generate(
                              //       finalmissing.length,
                              //       (index) => CustomMissingCard(
                              //         missing: finalmissing[index],
                              //       ),
                              //     ),
                              //   )
                              : (widget.serviceCategory ==
                                      ServiceCategory.medical)
                                  ? Wrap(
                                      children: List.generate(
                                        finalconsultation.length,
                                        (index) => CustomConsultationCard(
                                          consultation:
                                              finalconsultation[index],
                                        ),
                                      ),
                                    )
                                  : (widget.category == "Pets")
                                      ? Wrap(
                                          children: List.generate(
                                            DummyData.pets.length,
                                            (index) => CustomPetCard(
                                              pet: DummyData.pets[index],
                                            ),
                                          ),
                                        )
                                      : (widget.category == "Food")
                                          ? Wrap(
                                              children: List.generate(
                                                filteredPetFoods.length,
                                                (index) {
                                                  return CustomFoodCard(
                                                    food:
                                                        filteredPetFoods[index],
                                                  );
                                                },
                                              ),
                                            )
                                          : (widget.category == "Loss")
                                              ? Wrap(
                                                  children: List.generate(
                                                    filteredPetLoss.length,
                                                    (index) =>
                                                        CustomMissingCard(
                                                      missing: filteredPetLoss[
                                                          index],
                                                    ),
                                                  ),
                                                )
                                              : (widget.category ==
                                                      "Maintenance")
                                                  ? Wrap(
                                                      children: List.generate(
                                                        DummyData
                                                            .maitenance.length,
                                                        (index) =>
                                                            CustomMaintenanceCard(
                                                          maintenance: DummyData
                                                                  .maitenance[
                                                              index],
                                                        ),
                                                      ),
                                                    )
                                                  : (widget.category ==
                                                          "Consultation")
                                                      ? Wrap(
                                                          children:
                                                              List.generate(
                                                            DummyData.maitenance
                                                                .length,
                                                            (index) =>
                                                                CustomConsultationCard(
                                                              consultation:
                                                                  DummyData
                                                                          .consultation[
                                                                      index],
                                                            ),
                                                          ),
                                                        )
                                                      : const SizedBox(),
              // InkWell(
              //   onTap: () {},
              //   child: Image.asset(
              //     "assets/images/save.png",
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
