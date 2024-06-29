import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fyp/View/Login.dart';

import 'package:fyp/colors.dart';

class Splash extends StatefulWidget {
  static const routeName = '/';
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void decideNavigation() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(Login.routeName, (route) => false);
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      decideNavigation();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: Center(child: SvgPicture.asset('assets/svg/pet 1.svg')),
    );
  }
}
