// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fyp/View/Login.dart';
import 'package:fyp/View/bottom_nav_screen.dart';
import 'package:fyp/View/getstarted.dart';
import 'package:fyp/View/registeration.dart';
import 'package:fyp/View/otp.dart';

import 'package:fyp/View/splash.dart';

class MyRoute {
  static Route<dynamic> onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case Splash.routeName:
        {
          return MaterialPageRoute(
            builder: (context) => const Splash(),
          );
        }

      case Login.routeName:
        {
          return MaterialPageRoute(
            builder: (context) => const Login(),
          );
        }

      case Register.routeName:
        {
          return MaterialPageRoute(
            builder: ((context) => const Register()),
          );
        }
      case Otp.routeName:
        {
          return MaterialPageRoute(
            builder: (contexr) => const Otp(),
          );
        }

      case Start.routeName:
        {
          return MaterialPageRoute(
            builder: ((context) => const Start()),
          );
        }

      case BottomNavScreen.routeName:
        {
          return MaterialPageRoute(
            builder: ((context) => const BottomNavScreen()),
          );
        }

      default:
        {
          return MaterialPageRoute(
            builder: (context) => const Login(),
          );
        }
    }
  }
}
