import 'package:flutter/material.dart';

class CustomTextFieldAddress extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const CustomTextFieldAddress({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            borderSide:
                BorderSide(color: Color(0xff86C6D0)), // Adjust width as needed
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            borderSide:
                BorderSide(color: Color(0xff86C6D0)), // Adjust width as needed
          ),
          label: Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color(0xff034B56),
            ),
          ),
        ),
      ),
    );
  }
}
