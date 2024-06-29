// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fyp/View/registeration.dart';

import 'package:fyp/colors.dart';
import 'package:fyp/core/models/user_model.dart';

import 'package:fyp/provider/auth_provider/auth.provider.dart';
import 'package:fyp/provider/auth_provider/user_provider.dart';
import 'package:fyp/shared_perefrences/shared_perefrences.dart';

import 'package:fyp/wigets/custom_button.dart';
import 'package:fyp/wigets/custom_textfield.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  static const routeName = 'Loginpage';
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    void doLogin() async {
      // await UserPreferences().saveUser(UserModel(id: '1',email: 'asaddq518@gmail.com'));
      // Navigator.pushReplacementNamed(context, 'Start');
 
      final form = formKey.currentState;
      if (form!.validate()) {
        form.save();

        final response = await auth.login(
          emailController.text,
          passwordController.text,
        );

        UserModel user = UserModel.fromJson(response['data']);
        Provider.of<UserProvider>(context, listen: false).setUser(user);
        await UserPreferences().saveUser(user);
        Navigator.pushReplacementNamed(context, 'Start');
      }
    }

    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Center(
                child: Image.asset('assets/images/Login.png'),
              ),
              SizedBox(height: 10.h),
              CustomTextField(
                label: "Email",
                obscureText: false,
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  } else if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.h),
              CustomTextField(
                label: "Password",
                obscureText: true,
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  } else if (value.length < 5) {
                    return 'Password must be at least 5 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: const EdgeInsets.only(left: 229, right: 27),
                child: InkWell(
                  onTap: () {},
                  child: const Text(
                    "Forget Password?",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              CustomButton(text: "Login", onPressed: doLogin),
              const SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Register.routeName);
                },
                child: const Text(
                  "You don’t have an account?",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: const Size(280, 47),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset('assets/svg/G.svg'),
                    const SizedBox(width: 5),
                    const Text(
                      "Continue with Google",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff1877F2),
                  minimumSize: const Size(280, 47),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset("assets/svg/f.svg"),
                    const SizedBox(width: 5),
                    const Text(
                      "Continue with Facebook",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
