import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fyp/colors.dart';
import 'package:fyp/wigets/custom_button.dart';
import 'package:pinput/pinput.dart';

class Otp extends StatefulWidget {
  static const routeName = 'otp';
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundcolor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SvgPicture.asset('assets/svg/otp.svg'),
            ),
            SizedBox(
              height: 20.h,
            ),
            const Center(
              child: Text(
                "OTP Verification",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 50,
                right: 50,
              ),
              child: Center(
                child: Text(
                  "Thank you for registering with you. Please type the OPT as shared on your mobile XXXXXXX123",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Pinput(
              length: 4,
              defaultPinTheme: PinTheme(
                height: 75.0,
                width: 75.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: const Color(0xff157a8c),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "OTP not received?",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomButton(
              text: 'Submit',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
