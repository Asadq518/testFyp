import 'package:currency_formatter/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/View/confrim_order_screen.dart';
import 'package:fyp/core/models/food_model.dart';
import 'package:fyp/wigets/custom_button.dart';
import 'package:fyp/wigets/custom_textfiled_adreess.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressScreen extends StatefulWidget {
  final FoodModel food;
  const AddressScreen({
    super.key,
    required this.food,
  });

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  bool liked = false;
  CurrencyFormat pkrSetting = const CurrencyFormat(
    code: 'pkr',
    symbol: 'Rs',
    symbolSide: SymbolSide.left,
    thousandSeparator: ',',
    decimalSeparator: '.',
    symbolSeparator: ' ',
  );
  bool isChecked = false;
  bool risChecked = false;
//  int checkType = 1;
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phonenumber1 = TextEditingController();
  TextEditingController phonenumber2 = TextEditingController();
  TextEditingController postal = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController city = TextEditingController();

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
          "Add New Address",
          style: GoogleFonts.poppins(
            // fontStyle: FontStyle.italic,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xff034B56),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 5),
                  child: Text(
                    "Email",
                    style: GoogleFonts.poppins(
                      // fontStyle: FontStyle.italic,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff034B56),
                    ),
                  ),
                ),
              ],
            ),

            // ignore: prefer_const_constructors
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: const TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide(
                        color: Color(0xff86C6D0)), // Adjust width as needed
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide(
                        color: Color(0xff86C6D0)), // Adjust width as needed
                  ),
                  label: Text(
                    "Please Enter email ",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff034B56),
                    ),
                  ),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(right: 100, top: 5),
              child: Text(
                "Email me with news and offers",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 105, 165, 174),
                ),
              ),
            ),

            Container(
              width: 434,
              height: 800,
              // ignore: sort_child_properties_last
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 220, top: 10),
                    child: Text(
                      "Delivery",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff034B56),
                      ),
                    ),
                  ),
                  CustomTextFieldAddress(
                    label: "First Name",
                    controller: firstname,
                  ),
                  CustomTextFieldAddress(
                    label: "Last Name",
                    controller: lastname,
                  ),
                  CustomTextFieldAddress(
                    label: "Address",
                    controller: address,
                  ),

                  CustomTextFieldAddress(
                    label: "Country",
                    controller: country,
                  ),
                  CustomTextFieldAddress(
                    label: "City",
                    controller: city,
                  ),
                  CustomTextFieldAddress(
                    label: "Postal Code",
                    controller: postal,
                  ),
                  CustomTextFieldAddress(
                    label: "Phone Number 1",
                    controller: phonenumber1,
                  ),
                  CustomTextFieldAddress(
                    label: "Phone Number 2",
                    controller: phonenumber2,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Checkbox(
                          activeColor: const Color(0xff86C6D0),
                          fillColor:
                              const MaterialStatePropertyAll(Color(0xff86C6D0)),
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        const Text(
                          "Save this information for next time",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff034B56),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 396,
                      height: 65,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff86C6D0)),
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0x218f8f8f),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "Free Shipping Across Pakistan",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff034B56),
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              "Free ",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff034B56),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  // ignore: prefer_const_constructors
                ],
              ),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xfff0f5f6),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: 440,
              height: 248,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xfff0f5f6)),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 230, top: 20),
                    child: Text(
                      "Payment ",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff034B56),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5, right: 110),
                    child: Text(
                      "All transactions are secure and\nencrypted. ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff034B56),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Container(
                        width: 396,
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 145, 213, 223)),
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0x218f8f8f)),
                        child: Row(
                          children: [
                            Radio(
                              fillColor: const MaterialStatePropertyAll(
                                  Color(0xff034B56)),
                              value: risChecked,
                              groupValue: risChecked,
                              onChanged: (bool? risCheecked) {
                                setState(
                                  () {
                                    risChecked = !risChecked;
                                  },
                                );
                              },
                            ),
                            const Text(
                              "Cash on Delivery (COD) ",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff034B56),
                              ),
                            ),
                          ],
                        )),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15, right: 10, left: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Card(
                        color: const Color(0xffF0F5F6),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          //set border radius more than 50% of height and width to make circle
                        ),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 115, top: 15),
                              child: Text(
                                "Order Summary",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff034B56),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 10,
                                    top: 10,
                                  ),
                                  child: Container(
                                    height: 230.w,
                                    width: 230.h,
                                    decoration: const BoxDecoration(),
                                    child: Stack(
                                      children: [
                                        Align(
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                                widget.food.foodImage!)),
                                        Padding(
                                          padding: const EdgeInsets.all(6.0),
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
                                                        Icons
                                                            .favorite_border_outlined,
                                                        color:
                                                            Color(0xff2f6a74),
                                                      ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 5,
                                      ),
                                      child: Text(widget.food.foodName!,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 55,
                                        top: 10,
                                      ),
                                      child: Text(
                                        widget.food.category!,
                                        style: GoogleFonts.montserrat(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xff2f6a74),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 27,
                                        top: 10,
                                      ),
                                      child: Text(
                                        CurrencyFormatter.format(
                                          widget.food.price,
                                          pkrSetting,
                                        ),
                                        style: GoogleFonts.montserrat(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 25),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(top: 30, right: 40),
                                        child: Text(
                                          "Items Total ",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff034B56),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(right: 40),
                                        child: Text(
                                          "Delivery Fee",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff034B56),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      // ignore: prefer_const_constructors
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 40),
                                        child: const Text(
                                          " Total Payment",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff034B56),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 30),
                                          child: Text(
                                            CurrencyFormatter.format(
                                              widget.food.price,
                                              pkrSetting,
                                            ),
                                            style: GoogleFonts.montserrat(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 25),
                                          child: Text(
                                            " Free Shipping ",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff034B56),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Text(
                                          CurrencyFormatter.format(
                                            widget.food.price,
                                            pkrSetting,
                                          ),
                                          style: GoogleFonts.montserrat(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                  text: "Complete Oder",
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ConfirmOder()));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
