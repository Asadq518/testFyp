import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/View/missing_pet/deatils_screen_missing.dart';
import 'package:fyp/config/api_config.dart';
import 'package:fyp/core/models/pet_missing_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CustomMissingCard extends StatefulWidget {
  final PetMissingModel missing;
  final bool myads;

  final Function()? onTap;
  const CustomMissingCard({
    super.key,
    this.onTap,
    this.myads = false,
    required this.missing,
  });

  @override
  State<CustomMissingCard> createState() => _CustomMissingCardState();
}

// ignore: camel_case_types
class _CustomMissingCardState extends State<CustomMissingCard> {
  bool liked = false;
  var adsstatus = 'Active';
  @override
  Widget build(BuildContext context) {
    print(widget.missing.images![0]);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                DeatilsScreenMissing(missing: widget.missing)));
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
                        child: Image.network(widget.missing.images![0])),
                    widget.myads
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: IconButton(
                                onPressed: () async {
                                  print(
                                      '${Config.apiURL1}/api/missings/${widget.missing.id}');
                                  final response = await http.delete(Uri.parse(
                                      '${Config.apiURL1}/api/missings/${widget.missing.id}'));

                                  if (response.statusCode == 200) {
                                    adsstatus = 'InActive';
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
                                          color: Color(0xff2f6a74),
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
              child: Text(widget.missing.petName!,
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 25,
                top: 7,
              ),
              child: Text(
                widget.missing.breed!,
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
                widget.missing.location!,
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff2f6a74),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 70,
                top: 7,
                bottom: 10,
              ),
              child: Text(
                adsstatus,
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xffC61212),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
