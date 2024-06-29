import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:fyp/core/dummy_data/enums.dart';
import 'package:fyp/core/models/pet_model.dart';
// import 'package:fyp/provider/auth_provider/auth.provider.dart';
import 'package:fyp/provider/pet_post_provider/pet_provider.dart';

import 'package:fyp/wigets/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:images_picker/images_picker.dart';
import 'package:provider/provider.dart';

class AddScreeeforsell extends StatefulWidget {
  const AddScreeeforsell({super.key});

  @override
  State<AddScreeeforsell> createState() => _AddScreeeforsellState();
}

class _AddScreeeforsellState extends State<AddScreeeforsell> {
  // final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  String? selectedValue;
  String? selectedbreed;
  int tag = 1;
  String? selectedSex;
  String? _selectedGender = '';
  Gender? selectedGender;
  Vaccinated? vacci;
  List<File?>? images = [];

  List<String> get values => [
        'Animal is Cat',
        'Animal is Dog',
        'Animal is Rabbits',
      ];
  List<String> get val => [
        'Breed is American',
        'Breed is Birman',
        'Breed is Bombay',
        'Breed is Russian',
        'Breed is Persian',
        'Breed is Maine Coon',
        'Breed is Others',
      ];

  List<DropdownMenuItem<String>> get dropdownItems {
    return values.map((value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }

  List<DropdownMenuItem<String>> get breeditems {
    return val.map((val) {
      return DropdownMenuItem<String>(
        value: val,
        child: Text(val),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    // PostpetVM vm = context.watch<PostpetVM>();
    // AuthProvider auth = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 142, 199, 207),
        title: Text(
          "Include some details",
          style: GoogleFonts.poppins(
            // fontStyle: FontStyle.italic,
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: const Color(0xff034B56),
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Color(0xff094953),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
              child: Container(
                // width: 30.w,
                height: 60.h,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 142, 199, 207),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "UPLOAD UP TO 20 PHOTOS",
                        style: GoogleFonts.poppins(
                          // fontStyle: FontStyle.italic,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff034B56),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    InkWell(
                      onTap: () async {
                        final List<Media>? res = await ImagesPicker.pick(
                          count: 20, // Allow up to 20 images to be picked
                          pickType: PickType.image,
                        );

                        if (res != null) {
                          for (var media in res) {
                            images?.add(File(media.path));
                          }
                          setState(() {}); // Update the UI
                        }
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Color(0xff034B56),
                      ),
                    )
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: InkWell(
                onTap: () async {
                    final List<Media>? res = await ImagesPicker.pick(
                      count:
                          10, // You can change the count as per your requirement
                      pickType: PickType.image,
                    );

                    if (res != null) {
                      for (var media in res) {
                        images?.add(File(media.path));
                      }
                      setState(() {}); // Add this line to update the UI
                    }
                },
                child: images!.isEmpty
                    ? SvgPicture.asset("assets/svg/Add images button.svg")
                    : const SizedBox(), // Hide the SvgPicture when images are added
              ),
            ),
            images!.isEmpty
                ? const SizedBox()
                : CarouselSlider(
                    options: CarouselOptions(
                      height: 300,
                      aspectRatio: 9 / 10,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                    ),
                    items: images!.map((image) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Stack(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 1000,
                                  child: Image.file(
                                    image!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      images!.remove(image);
                                    });
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.only(right: 20),
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }).toList(),
                  ),
                  
            Padding(
              padding: const EdgeInsets.only(right: 200, top: 25),
              child: Text(
                "Categories*",
                style: GoogleFonts.poppins(
                  // fontStyle: FontStyle.italic,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff034B56),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/PL.png",
                    width: 85.w,
                    height: 85.h,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: const Color(0xff86C6D0)),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: DropdownButton<String>(
                            borderRadius: BorderRadius.circular(20),
                            value: selectedValue,
                            hint: Text(
                              "Please Select an Animal",
                              style: GoogleFonts.poppins(
                                // fontStyle: FontStyle.italic,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff034B56),
                              ),
                            ),
                            underline: const SizedBox(),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            items: dropdownItems,
                            onChanged: (value) {
                              setState(
                                () {
                                  selectedValue = value;
                                },
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 18, right: 18, top: 15),
              child: Divider(
                color: Color(0xff86C6D0),
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  Text(
                    "Name *",
                    style: GoogleFonts.poppins(
                      // fontStyle: FontStyle.italic,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff034B56),
                    ),
                  ),
                ],
              ),
            ),
            // Text Field for Price
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextField(
                controller: _namecontroller,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                      color: Color(0xff86C6D0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                      color: Color(0xff86C6D0),
                    ),
                  ),
                  labelText: "Please Enter Pet Name  ",
                  labelStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff034B56),
                  ),
                ),
              ),
            ),
            // Divider

            const Padding(
              padding: EdgeInsets.only(left: 18, right: 18, top: 5),
              child: Divider(
                color: Color(0xff86C6D0),
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  Text(
                    "Title *",
                    style: GoogleFonts.poppins(
                      // fontStyle: FontStyle.italic,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff034B56),
                    ),
                  ),
                ],
              ),
            ),
            // Text Field for Price
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                      color: Color(0xff86C6D0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                      color: Color(0xff86C6D0),
                    ),
                  ),
                  labelText: "Please Enter Pet Title  ",
                  labelStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff034B56),
                  ),
                ),
              ),
            ),
            // Divider

            const Padding(
              padding: EdgeInsets.only(left: 18, right: 18, top: 5),
              child: Divider(
                color: Color(0xff86C6D0),
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  Text(
                    "Price *",
                    style: GoogleFonts.poppins(
                      // fontStyle: FontStyle.italic,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff034B56),
                    ),
                  ),
                ],
              ),
            ),
            // Text Field for Price
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextField(
                controller: _priceController,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                      color: Color(0xff86C6D0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                      color: Color(0xff86C6D0),
                    ),
                  ),
                  labelText: "Please Enter Price",
                  labelStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff034B56),
                  ),
                ),
              ),
            ),
            // Divider
            const Padding(
              padding: EdgeInsets.only(left: 18, right: 18, top: 15),
              child: Divider(
                color: Color(0xff86C6D0),
                thickness: 1,
              ),
            ),

            // Breed
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  Text(
                    "Breed *",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff034B56),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 60),
              child: Container(
                width: 220,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: const Color(0xff86C6D0)),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(20),
                  value: selectedbreed,
                  hint: Text(
                    "Please Select a Breed",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff034B56),
                    ),
                  ),
                  underline: const SizedBox(),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  items: breeditems,
                  onChanged: (val) {
                    setState(() {
                      selectedbreed = val;
                    });
                  },
                ),
              ),
            ),
            // Divider
            const Padding(
              padding: EdgeInsets.only(left: 18, right: 18, top: 15),
              child: Divider(
                color: Color(0xff86C6D0),
                thickness: 1,
              ),
            ),

            // Gender
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 10),
              child: Row(
                children: [
                  Text(
                    "Gender *",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff034B56),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                        _selectedGender = 'Male';
                      });
                    },
                    child: Container(
                      width: 80,
                      height: 40,
                      decoration: BoxDecoration(
                        color: selectedGender == Gender.male
                            ? const Color(0xff86C6D0)
                            : Colors.transparent,
                        border: Border.all(
                          width: 1,
                          color: const Color(0xff86C6D0),
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: Text(
                          "Male",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff034B56),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                        _selectedGender = 'Female';
                      });
                    },
                    child: Container(
                      width: 80,
                      height: 40,
                      decoration: BoxDecoration(
                        color: selectedGender == Gender.female
                            ? const Color(0xff86C6D0)
                            : Colors.transparent,
                        border: Border.all(
                          width: 1,
                          color: const Color(0xff86C6D0),
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: Text(
                          "Female",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff034B56),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.pair;
                        _selectedGender = 'Pair';
                      });
                    },
                    child: Container(
                      width: 80,
                      height: 40,
                      decoration: BoxDecoration(
                        color: selectedGender == Gender.pair
                            ? const Color(0xff86C6D0)
                            : Colors.transparent,
                        border: Border.all(
                          width: 1,
                          color: const Color(0xff86C6D0),
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: Text(
                          "Pair",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff034B56),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Divider
            const Padding(
              padding: EdgeInsets.only(left: 18, right: 18, top: 15),
              child: Divider(
                color: Color(0xff86C6D0),
                thickness: 1,
              ),
            ),

            // Age
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 10),
              child: Row(
                children: [
                  Text(
                    "Age *",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff034B56),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: TextField(
                controller: _ageController,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                      color: Color(0xff86C6D0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                      color: Color(0xff86C6D0),
                    ),
                  ),
                  labelText: "Please Enter Age",
                  labelStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff034B56),
                  ),
                ),
              ),
            ),
            // Divider
            const Padding(
              padding: EdgeInsets.only(left: 18, right: 18, top: 15),
              child: Divider(
                color: Color(0xff86C6D0),
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 10),
              child: Row(
                children: [
                  Text(
                    "Number *",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff034B56),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: TextField(
                controller: _numberController,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                      color: Color(0xff86C6D0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                      color: Color(0xff86C6D0),
                    ),
                  ),
                  labelText: "Please Enter Number",
                  labelStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff034B56),
                  ),
                ),
              ),
            ),
            // Divider
            const Padding(
              padding: EdgeInsets.only(left: 18, right: 18, top: 15),
              child: Divider(
                color: Color(0xff86C6D0),
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 10),
              child: Row(
                children: [
                  Text(
                    "Weight *",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff034B56),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: TextField(
                controller: _weight,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                      color: Color(0xff86C6D0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                      color: Color(0xff86C6D0),
                    ),
                  ),
                  labelText: "Please Enter Weight",
                  labelStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff034B56),
                  ),
                ),
              ),
            ),
            // Divider
            const Padding(
              padding: EdgeInsets.only(left: 18, right: 18, top: 15),
              child: Divider(
                color: Color(0xff86C6D0),
                thickness: 1,
              ),
            ),
            // Vaccinated
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 10),
              child: Row(
                children: [
                  Text(
                    "Vaccinated *",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff034B56),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        vacci = Vaccinated.yes;
                      });
                    },
                    child: Container(
                      width: 80,
                      height: 40,
                      decoration: BoxDecoration(
                        color: vacci == Vaccinated.yes
                            ? const Color(0xff86C6D0)
                            : Colors.transparent,
                        border: Border.all(
                          width: 1,
                          color: const Color(0xff86C6D0),
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: Text(
                          "Yes",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff034B56),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      setState(() {
                        vacci = Vaccinated.no;
                      });
                    },
                    child: Container(
                      width: 80,
                      height: 40,
                      decoration: BoxDecoration(
                        color: vacci == Vaccinated.no
                            ? const Color(0xff86C6D0)
                            : Colors.transparent,
                        border: Border.all(
                          width: 1,
                          color: const Color(0xff86C6D0),
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: Text(
                          "No",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff034B56),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Divider
            const Padding(
              padding: EdgeInsets.only(left: 18, right: 18, top: 15),
              child: Divider(
                color: Color(0xff86C6D0),
                thickness: 1,
              ),
            ),

            // Description
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 10),
              child: Row(
                children: [
                  Text(
                    "Description",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff034B56),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextField(
                controller: _descriptionController,
                maxLines: 5,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                      color: Color(0xff86C6D0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                      color: Color(0xff86C6D0),
                    ),
                  ),
                  hintText: "Please write the Description",
                  hintStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff034B56),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            CustomButton(
              text: "Submit",
              onPressed: () async {
                try {
                  List<String> imagePaths = [];
                  for (var path in images!) {
                    imagePaths.add(path!.path);
                  }
                  PetModel pet = PetModel(
                    title: _titleController.text.trim(),
                    name: _namecontroller.text.trim(),
                    description: _descriptionController.text.trim(),
                    price: int.parse(_priceController.text.trim()),
                    age: _ageController.text.trim(),
                    vaccination: vacci != null
                        ? (vacci == Vaccinated.yes ? 'Yes' : 'No')
                        : 'Unknown',
                    breed: selectedbreed ?? '',
                    sex: _selectedGender,
                    number: _numberController.text.trim(),
                    weight: _weight.text.trim(),
                    images: imagePaths,
                  );

                  await Provider.of<PetProvider>(context, listen: false).addPet(
                    pet,
                  );
                  Navigator.pushReplacementNamed(context, 'Start');
                } catch (error) {
                  if (kDebugMode) {
                    print('Error posting pet: $error');
                  }
                }
              },
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
