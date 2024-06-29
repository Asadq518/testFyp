import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fyp/View/deatils_screen_conslation.dart';
import 'package:fyp/config/api_config.dart';
import 'package:fyp/core/models/pet_medical_consultation_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class CustomConsultationCard extends StatefulWidget {
  final PetConsultationModel consultation;
  final bool myads;
  final Function()? onTap;
  const CustomConsultationCard({
    super.key,
    this.onTap,
    this.myads = false,
    required this.consultation,
  });

  @override
  State<CustomConsultationCard> createState() => _CustomConsultationCardState();
}

// ignore: camel_case_types
class _CustomConsultationCardState extends State<CustomConsultationCard> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                DeatilsScreenConsltation(conslutation: widget.consultation)));
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
                width: 150.w,
                decoration: const BoxDecoration(),
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Image.network(widget.consultation.images![0])),
                    widget.myads
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: IconButton(
                                onPressed: () async {
                                  print(
                                      '${Config.apiURL1}/api/hospitals/${widget.consultation.id}');
                                  final response = await http.delete(Uri.parse(
                                      '${Config.apiURL1}/api/hospitals/${widget.consultation.id}'));

                                  if (response.statusCode == 200) {
                                    setState(() {});
                                    print('Product deleted successfully');
                                  } else {}
                                },
                                icon: const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.delete,
                                    color: Color(0xff2f6a74),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Padding(
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
                            )),
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
                child: Text(widget.consultation.petName!,
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
                widget.consultation.category!,
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
                widget.consultation.location!,
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
                      print('asd');
                      var phoneNumber =
                          'tel:${widget.consultation.number}'; // Replace with your hardcoded phone number
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
                      final Uri emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: widget.consultation.mail,
                      );

                      if (await canLaunchUrl(emailLaunchUri)) {
                        await launchUrl(emailLaunchUri);
                      } else {
                        // throw 'Could not launch $email';
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
