import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/wigets/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmOder extends StatefulWidget {
  const ConfirmOder({super.key});

  @override
  State<ConfirmOder> createState() => _ConfirmOderState();
}

class _ConfirmOderState extends State<ConfirmOder> {
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
          "Cash On Delivery",
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
            padding: const EdgeInsets.all(15),
            child: Container(
                width: 397.w,
                height: 102.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xfff0f5f6)),
                child: Row(
                  children: [
                    Image.asset("assets/images/Confrim.png"),
                    SizedBox(
                      width: 13.w,
                    ),
                    Text(
                      // widget.pet.title!,
                      "You can pay in cash to our courier\nwhen you receive the goods at\nyour doorstep.",
                      style: GoogleFonts.montserrat(
                        // fontStyle: FontStyle.italic,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff2f6a74),
                      ),
                    ),
                  ],
                )),
          ),
          const SizedBox(
            height: 344,
          ),
          Container(
            width: 434,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xfff0f5f6),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 190, top: 40),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: Text(
                          "Subtotal",
                          style: GoogleFonts.poppins(
                            // fontStyle: FontStyle.italic,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff034B56),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        "Shipping Fee",
                        style: GoogleFonts.poppins(
                          // fontStyle: FontStyle.italic,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff034B56),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        " Total Amount",
                        style: GoogleFonts.poppins(
                          // fontStyle: FontStyle.italic,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff034B56),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: CustomButton(text: "Confirm Order", onPressed: () {}),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
