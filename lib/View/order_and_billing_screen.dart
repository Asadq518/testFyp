import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/View/myorder_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class BillingOrderScreen extends StatefulWidget {
  const BillingOrderScreen({super.key});

  @override
  State<BillingOrderScreen> createState() => _BillingOrderScreenState();
}

class _BillingOrderScreenState extends State<BillingOrderScreen> {
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
          "Oders and Billing Info",
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
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 140, top: 20),
                    child: Text(
                      "My Orders",
                      style: GoogleFonts.poppins(
                        // fontStyle: FontStyle.italic,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff034B56),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 10),
                    child: Text(
                      "Active, scheduled and expired orders",
                      style: GoogleFonts.poppins(
                        // fontStyle: FontStyle.italic,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff034B56),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 20.w,
              ),
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        // ignore: prefer_const_constructors
                        builder: (context) => MyOrdersScreen()));
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color(0xff034B56),
                    size: 40,
                  ),
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Divider(
              color: Color(0xff86C6D0),
              thickness: 1,
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 68, top: 20),
                    child: Text(
                      "Billing Information",
                      style: GoogleFonts.poppins(
                        // fontStyle: FontStyle.italic,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff034B56),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 10),
                    child: Text(
                      "Edit your billing name, address, etc.",
                      style: GoogleFonts.poppins(
                        // fontStyle: FontStyle.italic,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff034B56),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 33.w,
              ),
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xff034B56),
                  size: 40,
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Divider(
              color: Color(0xff86C6D0),
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
