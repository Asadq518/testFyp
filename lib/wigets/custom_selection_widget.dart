import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CategorySelection extends StatelessWidget {
  final String name;
  final String img;
  final Function()? onPrssed;
  final Function()? onTap;

  const CategorySelection({
    super.key,
    required this.name,
    required this.img,
    this.onTap,
    this.onPrssed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 12,
        right: 12,
      ),
      child: InkWell(
        onTap: onTap,
        child: Card(
          shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          color: const Color(0xfff0f5f6),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(img),
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  name,
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff094953),
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: onPrssed,
                  icon: SvgPicture.asset("assets/svg/back1.svg"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
