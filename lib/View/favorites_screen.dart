import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 142, 199, 207),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff034B56),
          ),
        ),
        title: Text(
          "Favorites & Saved",
          style: GoogleFonts.poppins(
            // fontStyle: FontStyle.italic,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xff034B56),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(color: Color(0xff86C6D0)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Favorites & Saved Items",
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
          const Center(
            child: Padding(
              padding: EdgeInsets.only(),
              child: SizedBox(
                // width: 235.w,
                child: Divider(
                  color: Color(0xff86C6D0),
                  thickness: 3,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xffF0F5F6)),
              width: 300,
              height: 155,
              child: Row(
                children: [
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset("assets/images/image 1.png"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 40),
                          child: Text(
                            "Bella",
                            style: GoogleFonts.poppins(
                              // fontStyle: FontStyle.italic,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            "Cat Breed",
                            style: GoogleFonts.poppins(
                              // fontStyle: FontStyle.italic,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff2f6a74),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            "Johar Town",
                            style: GoogleFonts.poppins(
                              // fontStyle: FontStyle.italic,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff2f6a74),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "PKR 150,000",
                            style: GoogleFonts.poppins(
                              // fontStyle: FontStyle.italic,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xffF0F5F6)),
              width: 300,
              height: 155,
              child: Row(
                children: [
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset("assets/images/image 19.png"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 40),
                          child: Text(
                            "Bella",
                            style: GoogleFonts.poppins(
                              // fontStyle: FontStyle.italic,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            "Cat Breed",
                            style: GoogleFonts.poppins(
                              // fontStyle: FontStyle.italic,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff2f6a74),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            "Johar Town",
                            style: GoogleFonts.poppins(
                              // fontStyle: FontStyle.italic,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff2f6a74),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "PKR 150,000",
                            style: GoogleFonts.poppins(
                              // fontStyle: FontStyle.italic,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
