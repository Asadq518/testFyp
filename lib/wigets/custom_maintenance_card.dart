import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fyp/View/deatils_maintenance_screen.dart';
import 'package:fyp/core/models/pet_maintenance_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomMaintenanceCard extends StatefulWidget {
  final PetMaintenanceModel maintenance;

  final Function()? onTap;
  const CustomMaintenanceCard({
    super.key,
    this.onTap,
    required this.maintenance,
  });

  @override
  State<CustomMaintenanceCard> createState() => _CustomMaintenanceCardState();
}

// ignore: camel_case_types
class _CustomMaintenanceCardState extends State<CustomMaintenanceCard> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                DeatilsMaintenanceScreen(maintenance: widget.maintenance)));
      },
      child: Card(
        color: const Color(0xffF0F5F6),
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          //set border radius more than 50% of height and width to make circle
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
              ),
              child: Container(
                height: 150.h,
                width: 150.h,
                decoration: const BoxDecoration(),
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Image.asset(widget.maintenance.image!)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 25,
                top: 7,
              ),
              child: SizedBox(
                width: 130.w,
                child: Text(widget.maintenance.petName!,
                    softWrap: true,
                    maxLines: 2,
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 25,
                top: 7,
              ),
              child: Text(
                widget.maintenance.category!,
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff2f6a74),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 25,
                top: 7,
              ),
              child: Text(
                widget.maintenance.location!,
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff2f6a74),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 20,
                bottom: 10,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () async {
                      final phoneNumber =
                          'tel:+1234567890'; // Replace with your hardcoded phone number
                      if (await canLaunchUrl(Uri.parse(phoneNumber))) {
                        await launchUrl(Uri.parse(phoneNumber));
                      } else {
                        throw 'Could not launch $phoneNumber';
                      }
                    },
                    child: SvgPicture.asset("assets/svg/phone.svg"),
                  ),
                  SizedBox(
                    width: 90.w,
                  ),
                  InkWell(
                    onTap: () async {
                      final Uri phoneNumber = Uri(
                        scheme: 'sms',
                        path:
                            '+1234567890', // Replace with your hardcoded phone number
                      );

                      if (await canLaunch(phoneNumber.toString())) {
                        await launch(phoneNumber.toString());
                      } else {
                        throw 'Could not launch $phoneNumber';
                      }
                    },
                    child: SvgPicture.asset("assets/svg/sms.svg"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
