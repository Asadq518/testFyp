import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
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
            Icons.arrow_back,
            color: Color(0xff034B56),
          ),
        ),
        title: Text(
          "My Orders",
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
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 20),
            child: Container(
                width: 300,
                height: 110,
                // ignore: sort_child_properties_last
                child: Row(
                  children: [
                    Image.asset("assets/images/fff.png"),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30, right: 65),
                          child: Text(
                            "Processing",
                            style: GoogleFonts.poppins(
                              // fontStyle: FontStyle.italic,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff034B56),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Text(
                            "Oder ID : 5443679032",
                            style: GoogleFonts.poppins(
                              // fontStyle: FontStyle.italic,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff034B56),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // ignore: prefer_const_constructors
                    color: Color(0xfff0f5f6))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 20),
            child: Container(
                width: 300,
                height: 110,
                // ignore: sort_child_properties_last
                child: Row(
                  children: [
                    Image.asset("assets/images/ffff2.png"),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30, right: 65),
                          child: Text(
                            "Processing",
                            style: GoogleFonts.poppins(
                              // fontStyle: FontStyle.italic,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff034B56),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Text(
                            "Oder ID : 5443679032",
                            style: GoogleFonts.poppins(
                              // fontStyle: FontStyle.italic,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff034B56),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // ignore: prefer_const_constructors
                    color: Color(0xfff0f5f6))),
          )
        ],
      ),
    );
  }
}
