import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fyp/View/chat_deatils_screen.dart';
import 'package:fyp/core/models/chat_model.dart';

class CustomChatWidget extends StatefulWidget {
  final ChatModel chat;
  const CustomChatWidget({super.key, required this.chat});

  @override
  State<CustomChatWidget> createState() => _CustomChatWidgetState();
}

class _CustomChatWidgetState extends State<CustomChatWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ChatDeatilsScreen()));
        },
        child: Container(
          // ignore: sort_child_properties_last
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: SvgPicture.asset(widget.chat.image!),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Column(
                      children: [
                        Text(
                          widget.chat.name!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff034B56),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 10, top: 10),
                          child: Text(
                            "Number View",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 126, 178, 186),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Color(0xffE2EFF1)),
          width: 370.w,
          height: 90.h,
        ),
      ),
    );
  }
}
