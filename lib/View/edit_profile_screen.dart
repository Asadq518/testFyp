import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  String? selectedgender;
  TextEditingController dateController = TextEditingController();

  List<String> get values => [
        'Male',
        'Female',
        'Other',
      ];

  List<DropdownMenuItem<String>> get genderitems {
    return values.map((values) {
      return DropdownMenuItem<String>(
        value: values,
        child: Text(values),
      );
    }).toList();
  }

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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: SvgPicture.asset(
              "assets/svg/Save.svg",
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(right: 90, top: 10),
            child: Text(
              "Basic information",
              style: GoogleFonts.poppins(
                // fontStyle: FontStyle.italic,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: const Color(0xff034B56),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: SvgPicture.asset(
                  "assets/svg/emoji.svg",
                  width: 120.w,
                  height: 120.h,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Text(
                      "Enter your Name",
                      style: GoogleFonts.poppins(
                        // fontStyle: FontStyle.italic,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff034B56),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 200,
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          borderSide: BorderSide(
                              color:
                                  Color(0xff86C6D0)), // Adjust width as needed
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          borderSide: BorderSide(
                              color:
                                  Color(0xff86C6D0)), // Adjust width as needed
                        ),
                        label: Text(
                          "Please Enter Name",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff034B56),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 100, top: 10),
            child: Text(
              "Something About Your",
              style: GoogleFonts.poppins(
                // fontStyle: FontStyle.italic,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xff034B56),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 5),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  borderSide: BorderSide(
                      color: Color(0xff86C6D0)), // Adjust width as needed
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  borderSide: BorderSide(
                      color: Color(0xff86C6D0)), // Adjust width as needed
                ),
                label: Text(
                  "Please Enter Details",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff034B56),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
              top: 15,
            ),
            child: Row(
              children: [
                Text(
                  "Gender",
                  style: GoogleFonts.poppins(
                    // fontStyle: FontStyle.italic,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff034B56),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Container(
              width: 270,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: const Color(0xff86C6D0)),
                  borderRadius: BorderRadius.circular(10.0)),
              child: DropdownButton<String>(
                borderRadius: BorderRadius.circular(20),
                value: selectedgender,
                hint: Text(
                  "Please Select a Gender",
                  style: GoogleFonts.poppins(
                    // fontStyle: FontStyle.italic,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff034B56),
                  ),
                ),
                underline: const SizedBox(),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                items: genderitems,
                onChanged: (values) {
                  setState(
                    () {
                      selectedgender = values;
                    },
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 185, top: 10),
            child: Text(
              "Date Of Birth",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xff034B56),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
            child: InkWell(
              onTap: () async {
                var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime(1999),
                    firstDate: DateTime(1999),
                    lastDate: DateTime(2050));
                setState(() {
                  dateController.text = date.toString();
                });
              },
              child: TextField(
                enabled: false,
                controller: dateController,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    borderSide: BorderSide(
                        color: Color(0xff86C6D0)), // Adjust width as needed
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    borderSide: BorderSide(
                        color: Color(0xff86C6D0)), // Adjust width as needed
                  ),
                  label: Text(
                    "DD/MM/YYYY",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff034B56),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: SizedBox(
              // width: 130.w,
              child: Divider(
                color: Color(0xff86C6D0),
                thickness: 1,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 130, top: 10),
            child: Text(
              "Contact information",
              style: GoogleFonts.poppins(
                // fontStyle: FontStyle.italic,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xff034B56),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 165, top: 15),
            child: Text(
              "Phone Number",
              style: GoogleFonts.poppins(
                // fontStyle: FontStyle.italic,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xff034B56),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 5),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  borderSide: BorderSide(
                      color: Color(0xff86C6D0)), // Adjust width as needed
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  borderSide: BorderSide(
                      color: Color(0xff86C6D0)), // Adjust width as needed
                ),
                label: Text(
                  "+92|000000000",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff034B56),
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 19,
              top: 5,
            ),
            child: Text(
              "This is the number for buyers contacts, reminders, and other notifications.",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff116572),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 235, top: 15),
            child: Text(
              "Email",
              style: GoogleFonts.poppins(
                // fontStyle: FontStyle.italic,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xff034B56),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 5),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  borderSide: BorderSide(
                      color: Color(0xff86C6D0)), // Adjust width as needed
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  borderSide: BorderSide(
                      color: Color(0xff86C6D0)), // Adjust width as needed
                ),
                label: Text(
                  "abcd44631@gmail.com",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff034B56),
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 5, right: 4, bottom: 10),
            child: Text(
              "This email will be useful to keep in touch. We won't share your private email address with other PET APP users",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff116572),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
