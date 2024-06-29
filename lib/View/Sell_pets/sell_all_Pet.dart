import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fyp/colors.dart';
import 'package:fyp/core/models/pet_medical_consultation_model.dart';
import 'package:fyp/core/models/pet_missing_model.dart';
import 'package:fyp/core/models/pet_model.dart';
import 'package:fyp/provider/pet_post_provider/pet_provider.dart';
import 'package:fyp/wigets/custom_consultation_card.dart';
import 'package:fyp/wigets/custom_missing_card.dart';
import 'package:fyp/wigets/custom_pet_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SeeAllProducts extends StatefulWidget {
  const SeeAllProducts({super.key});

  @override
  State<SeeAllProducts> createState() => _SeeAllProductsState();
}

class _SeeAllProductsState extends State<SeeAllProducts> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  List<PetModel> _pets = [];
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
      });
    });
    _fetchPets();
  }

  Future<void> _fetchPets() async {
    try {
      await context.read<PetProvider>().fetchPets();
      setState(() {
        _pets = context.read<PetProvider>().pets;
        print(_pets);
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      // Handle error
      print('Error: $e');
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var filteredPets = _pets.where((pet) {
      return pet.name!.toLowerCase().contains(_searchQuery.toLowerCase());
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
                            "pets",
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
                      "Showing: Results for pets",
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
                  ],
                ),
              ),
              _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Wrap(
                      children: List.generate(
                        filteredPets.length,
                        (index) => CustomPetCard(
                          pet: filteredPets[index],
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class SeeAllMissingProducts extends StatefulWidget {
  const SeeAllMissingProducts({super.key});

  @override
  State<SeeAllMissingProducts> createState() => _SeeAllProductsMissingState();
}

class _SeeAllProductsMissingState extends State<SeeAllMissingProducts> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  List<PetMissingModel> _pets = [];
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
      });
    });
    _fetchPets();
  }

  Future<void> _fetchPets() async {
    try {
      await context.read<PetProvider>().fetchMissingPets();
      setState(() {
        _pets = context.read<PetProvider>().missingpets;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      // Handle error
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var filteredPets = _pets.where((pet) {
      return pet.petName!.toLowerCase().contains(_searchQuery.toLowerCase());
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
                            "Loss",
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
                      "Showing: Results for pets",
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
                  ],
                ),
              ),
              _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Wrap(
                      children: List.generate(
                        filteredPets.length,
                        (index) => CustomMissingCard(
                          missing: filteredPets[index],
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class SeeAllHospitalProducts extends StatefulWidget {
  const SeeAllHospitalProducts({super.key});

  @override
  State<SeeAllHospitalProducts> createState() => _SeeAllHospitalProductState();
}

class _SeeAllHospitalProductState extends State<SeeAllHospitalProducts> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  List<PetConsultationModel> _pets = [];
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
      });
    });
    _fetchPets();
  }

  Future<void> _fetchPets() async {
    try {
      await context.read<PetProvider>().fetchHospitalPets();
      setState(() {
        _pets = context.read<PetProvider>().hospitalpets;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      // Handle error
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var filteredPets = _pets.where((pet) {
      return pet.hName!.toLowerCase().contains(_searchQuery.toLowerCase());
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
                            "Consult",
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
                      "Showing: Results for pets",
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
                  ],
                ),
              ),
              _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Wrap(
                      children: List.generate(
                        filteredPets.length,
                        (index) => CustomConsultationCard(
                          consultation: filteredPets[index],
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
