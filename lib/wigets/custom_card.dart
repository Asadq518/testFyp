import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/core/models/category_model.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCard extends StatelessWidget {
  final CategoryModel category;
  final Function()? onTap;
  const MyCard({
    super.key,
    this.onTap,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 7,
        right: 7,
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              width: 75.w,
              height: 75.h,
              decoration: BoxDecoration(
                color: const Color(0xffd9d9d9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(category.img!),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              category.name!,
              style: GoogleFonts.mogra(
                  // fontStyle: FontStyle.italic,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff2f6a74)),
            ),
          ],
        ),
      ),
    );
  }
}
