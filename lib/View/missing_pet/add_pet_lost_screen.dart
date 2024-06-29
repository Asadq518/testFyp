import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fyp/core/dummy_data/enums.dart';
import 'package:fyp/wigets/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:images_picker/images_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../core/models/pet_missing_model.dart';
import '../../provider/pet_post_provider/pet_provider.dart';

class PetLostAddScreen extends StatefulWidget {
  const PetLostAddScreen({super.key});

  @override
  State<PetLostAddScreen> createState() => _PetLostAddScreenState();
}

class _PetLostAddScreenState extends State<PetLostAddScreen> {
  TextEditingController age = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  Gender? selectedGender;
  String? selectedbreed;
  List<File?>? images = [];
  List<DropdownMenuItem<String>> get breeditems {
    return val.map((val) {
      return DropdownMenuItem<String>(
        value: val,
        child: Text(val),
      );
    }).toList();
  }

  List<String> get val => [
        'Breed is American',
        'Breed is Birman',
        'Breed is Bombay',
        'Breed is Russian',
        'Breed is Persian',
        'Breed is Maine Coon',
        'Breed is Others',
      ];
  TextEditingController date = TextEditingController();
  String? selectedValue;
  List<String> get values => [
        'Animal is Cat',
        'Animal is Dog',
        'Animal is Rabbits',
      ];
  List<DropdownMenuItem<String>> get dropdownItems {
    return values.map((value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
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
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 15),
                      //   child: Text(
                      //     "Animals",
                      //     style: GoogleFonts.poppins(
                      //       // fontStyle: FontStyle.italic,
                      //       fontSize: 20,
                      //       fontWeight: FontWeight.w500,
                      //       color: const Color(0xff034B56),
                      //     ),
                      //   ),
                      // ),
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
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 18, right: 18, top: 5),
              child: Divider(
                color: Color(0xff86C6D0),
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: InkWell(
                onTap: () async {
                  DateTime? pickeddate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickeddate != null) {
                    date.text = DateFormat('EEE, MMM d').format(pickeddate);
                    // date.text = pickeddate.toString();
                  }
                },
                child: TextField(
                  controller: date,
                  enabled: false,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_month_outlined),
                    label: Text(
                      "Please Enter Last seen Day / Date",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff034B56),
                      ),
                    ),
                  ),
                ),
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
                    "Breed *",
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
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Container(
                width: 250,
                height: 50,
                decoration: BoxDecoration(
                    border:
                        Border.all(width: 1, color: const Color(0xff86C6D0)),
                    borderRadius: BorderRadius.circular(10.0)),
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(20),
                  value: selectedbreed,
                  hint: Text(
                    "Please Select a Breed",
                    style: GoogleFonts.poppins(
                      // fontStyle: FontStyle.italic,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff034B56),
                    ),
                  ),
                  underline: const SizedBox(),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  items: breeditems,
                  onChanged: (val) {
                    setState(
                      () {
                        selectedbreed = val;
                      },
                    );
                  },
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 18,
                right: 18,
                top: 15,
              ),
              child: Divider(
                color: Color(0xff86C6D0),
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, bottom: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        // Gender.female;
                        if (selectedGender == null ||
                            selectedGender != Gender.male) {
                          selectedGender = Gender.male;
                        } else {
                          selectedGender = null;
                        }
                      });
                    },
                    child: Container(
                      width: 99,
                      height: 53,
                      decoration: BoxDecoration(
                        color: selectedGender == Gender.male
                            ? const Color(0xff86C6D0)
                            : Colors.transparent,
                        border: Border.all(
                            width: 1, color: const Color(0xff86C6D0)),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25, top: 13),
                        child: Text(
                          "Male",
                          style: GoogleFonts.poppins(
                            // fontStyle: FontStyle.italic,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff034B56),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        // Gender.female;
                        if (selectedGender == null ||
                            selectedGender != Gender.female) {
                          selectedGender = Gender.female;
                        } else {
                          selectedGender = null;
                        }
                      });
                    },
                    child: Container(
                      width: 99,
                      height: 53,
                      decoration: BoxDecoration(
                        color: selectedGender == Gender.female
                            ? const Color(0xff86C6D0)
                            : Colors.transparent,
                        border: Border.all(
                            width: 1, color: const Color(0xff86C6D0)),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18, top: 13),
                        child: Text(
                          "FEMALE",
                          style: GoogleFonts.poppins(
                            // fontStyle: FontStyle.italic,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff034B56),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (selectedGender == null ||
                            selectedGender != Gender.pair) {
                          selectedGender = Gender.pair;
                        } else {
                          selectedGender = null;
                        }
                      });
                    },
                    child: Container(
                      width: 99,
                      height: 53,
                      decoration: BoxDecoration(
                        color: selectedGender == Gender.pair
                            ? const Color(0xff86C6D0)
                            : Colors.transparent,
                        border: Border.all(
                            width: 1, color: const Color(0xff86C6D0)),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25, top: 13),
                        child: Text(
                          "PAIR",
                          style: GoogleFonts.poppins(
                            // fontStyle: FontStyle.italic,
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
            const Padding(
              padding: EdgeInsets.only(
                left: 18,
                right: 18,
              ),
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
                    "Age*",
                    style: GoogleFonts.poppins(
                      // fontStyle: FontStyle.italic,
                      fontSize: 16,
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
                controller: age,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                        color: Color(0xff86C6D0)), // Adjust width as needed
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                        color: Color(0xff86C6D0)), // Adjust width as needed
                  ),
                  label: Text(
                    "Please Enter Age",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff034B56),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  Text(
                    "Weight*",
                    style: GoogleFonts.poppins(
                      // fontStyle: FontStyle.italic,
                      fontSize: 16,
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
                controller: weight,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                        color: Color(0xff86C6D0)), // Adjust width as needed
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                        color: Color(0xff86C6D0)), // Adjust width as needed
                  ),
                  label: Text(
                    "Please Enter Weight",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff034B56),
                    ),
                  ),
                ),
              ),
            ),
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
                    "Add pet missing Area",
                    style: GoogleFonts.poppins(
                      // fontStyle: FontStyle.italic,
                      fontSize: 15,
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
                controller: area,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                        color: Color(0xff86C6D0)), // Adjust width as needed
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                        color: Color(0xff86C6D0)), // Adjust width as needed
                  ),
                  label: Text(
                    "Please Enter pet missing Area",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff034B56),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 18,
                right: 18,
                top: 10,
              ),
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
                    "Pet Name  *",
                    style: GoogleFonts.poppins(
                      // fontStyle: FontStyle.italic,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff034B56),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextField(
                controller: name,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                        color: Color(0xff86C6D0)), // Adjust width as needed
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                        color: Color(0xff86C6D0)), // Adjust width as needed
                  ),
                  labelText:
                      "Please Enter Pet Name  *", // Use labelText instead of label
                  labelStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff034B56),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  Text(
                    "Phone Number  *",
                    style: GoogleFonts.poppins(
                      // fontStyle: FontStyle.italic,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff034B56),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextField(
                controller: phone,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                        color: Color(0xff86C6D0)), // Adjust width as needed
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                        color: Color(0xff86C6D0)), // Adjust width as needed
                  ),
                  labelText:
                      "Please Enter phone number  *", // Use labelText instead of label
                  labelStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff034B56),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  Text(
                    "Email*",
                    style: GoogleFonts.poppins(
                      // fontStyle: FontStyle.italic,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff034B56),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextField(
                controller: email,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                        color: Color(0xff86C6D0)), // Adjust width as needed
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                        color: Color(0xff86C6D0)), // Adjust width as needed
                  ),
                  labelText:
                      "Please Enter Your Email  *", // Use labelText instead of label
                  labelStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff034B56),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 18,
                right: 18,
                top: 10,
              ),
              child: Divider(
                color: Color(0xff86C6D0),
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 15),
              child: CustomButton(
                text: "Submit",
                onPressed: () async {
                  try {
                    List<String> imagePaths = [];
                    for (var path in images!) {
                      imagePaths.add(path!.path);
                    }
                    PetMissingModel pet = PetMissingModel(
                      images: imagePaths,
                      petName: name.text.trim(),
                      category:selectedValue!.replaceFirst("Animal is ", ""),
                      age: age.text.trim(),
                      weight: weight.text.trim(),
                      breed: selectedbreed!.replaceFirst("Breed is ", ""),
                      sex: selectedGender == Gender.male
                          ? 'Male'
                          : selectedGender == Gender.female
                              ? 'Female'
                              : 'Pair',
                      lseen: date.text,
                      location: area.text.trim(),
                      number: phone.text.trim(),
                      mail: email.text.trim(),
                    );

                    await Provider.of<PetProvider>(context, listen: false)
                        .addPetMissing(
                      pet,
                    );
                    Navigator.pushReplacementNamed(context, 'Start');
                  } catch (error) {
                    // if (kDebugMode) {
                    print('Error posting pet: $error');
                    // }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
