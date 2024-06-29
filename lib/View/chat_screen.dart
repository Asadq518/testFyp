import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/core/dummy_data/dummy_data.dart';

import 'package:fyp/core/dummy_data/enums.dart';

import 'package:fyp/wigets/custom_chat_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Chats? chats;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Row(
                children: [
                  Text(
                    "Chats",
                    style: GoogleFonts.montserrat(
                        // fontStyle: FontStyle.italic,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        // ignore: prefer_const_constructors
                        color: Color(0xff034B56)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              child: Padding(
                padding: EdgeInsets.only(top: 5),
                child: Divider(
                  color: Color(0xff86C6D0),
                  thickness: 5,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (chats == null || chats != Chats.all) {
                          chats = Chats.all;
                        } else {
                          chats = null;
                        }
                      });
                    },
                    child: Container(
                      width: 95.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: chats == Chats.all
                            ? const Color(0xff86C6D0)
                            : Colors.transparent,
                        border: Border.all(
                            width: 1, color: const Color(0xff86C6D0)),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 30, bottom: 5, top: 5),
                        child: Text(
                          "All",
                          style: GoogleFonts.poppins(
                            // fontStyle: FontStyle.italic,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff034B56),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (chats == null || chats != Chats.unread) {
                                chats = Chats.unread;
                              } else {
                                chats = null;
                              }
                            });
                          },
                          child: Container(
                            width: 180.w,
                            height: 43.h,
                            decoration: BoxDecoration(
                              color: chats == Chats.unread
                                  ? const Color(0xff86C6D0)
                                  : Colors.transparent,
                              border: Border.all(
                                  width: 1, color: const Color(0xff86C6D0)),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, bottom: 5, top: 5),
                              child: Text(
                                "UNREAD CHATS",
                                style: GoogleFonts.poppins(
                                  // fontStyle: FontStyle.italic,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff034B56),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              child: Padding(
                padding: EdgeInsets.only(top: 7),
                child: Divider(
                  color: Color(0xff86C6D0),
                  thickness: 1,
                ),
              ),
            ),
            // CustomChatWidget(chat: widget.chats[0])
            Padding(
              padding: const EdgeInsets.only(left: 270, bottom: 10),
              child: Column(
                children: [
                  Text(
                    "Nov 3",
                    style: GoogleFonts.poppins(
                      // fontStyle: FontStyle.italic,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff034B56),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: List.generate(
                DummyData.chat.length,
                (index) => CustomChatWidget(
                  chat: DummyData.chat[index],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
