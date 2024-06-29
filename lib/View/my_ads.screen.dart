// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:fyp/core/models/user_model.dart';
import 'package:fyp/provider/pet_post_provider/pet_provider.dart';
import 'package:fyp/shared_perefrences/shared_perefrences.dart';
import 'package:fyp/wigets/custom_missing_card.dart';
import 'package:fyp/wigets/custom_pet_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../core/dummy_data/dummy_data.dart';
import '../wigets/custom_consultation_card.dart';

class MyAdsScreen extends StatefulWidget {
  const MyAdsScreen({super.key});

  @override
  State<MyAdsScreen> createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen> {
  @override
  void initState() {
    getPets();
    super.initState();
  }

  Future<void> getPets() async {
    var petProvider = context.read<PetProvider>();
    UserModel users = await UserPreferences().getUser();
    print("users");
    print(users.email);
    await petProvider.fetchMyMissingPets(users.email!);
    await petProvider.fetchMyHospitalPets(users.email!);
    await petProvider.fetchMyPets(users.email!);
  }

  @override
  Widget build(BuildContext context) {
    var petProvider = context.watch<PetProvider>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 142, 199, 207),
        automaticallyImplyLeading: false,
        title: Text(
          "My Ads",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xff034B56),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pets",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff2f6a74),
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
                        petProvider.mypets.length,
                        (index) => CustomPetCard(
                          myads: true,
                          pet: petProvider.pets[index],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Loss Pets",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff2f6a74),
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
                        petProvider.missingMypets.length,
                        (index) => CustomMissingCard(
                          myads: true,
                          missing: petProvider.missingMypets[index],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Pet Medical Consultation",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff2f6a74),
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
                        petProvider.hospitalMypets.length,
                        (index) => CustomConsultationCard(
                          myads: true,
                          consultation: petProvider.hospitalMypets[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
