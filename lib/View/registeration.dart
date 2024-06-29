// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/View/Login.dart';
import 'package:fyp/colors.dart';
import 'package:fyp/provider/auth_provider/auth.provider.dart';
import 'package:fyp/validate/validate.dart';
import 'package:fyp/wigets/custom_button.dart';
import 'package:fyp/wigets/custom_textfield.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  static const routeName = 'Register';
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);
  final formKey = GlobalKey<FormState>();
  bool isApiCallProcess = false;
  bool hidePassword = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    void doRegister() async {
      if (kDebugMode) {
        print('on doRegister');
      }
      final form = formKey.currentState;
      if (form!.validate()) {
        final response = await auth.register(
          emailController.text,
          passwordController.text,
        );
        // response = "success"

        if (response['success'] == true) {
          Navigator.pushReplacementNamed(context, 'Loginpage');
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please complete the form properly'),
          ),
        );
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
                child: Image.asset('assets/images/Register.png'),
              ),
              CustomTextField(
                label: 'Name',
                obscureText: false,
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextField(
                label: 'Email',
                validator: validateEmail,
                obscureText: false,
                controller: emailController,
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextField(
                label: 'Password',
                obscureText: true,
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 6) {
                    return 'Please enter a password with at least 6 characters';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextField(
                label: 'Re-enter Password',
                obscureText: true,
                controller: repasswordController,
                validator: (value) {
                  if (value != passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextField(
                label: 'Gender',
                obscureText: false,
                controller: genderController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your gender';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 25.h,
              ),
              CustomButton(
                text: 'Submit',
                onPressed: doRegister,
              ),
              SizedBox(
                height: 8.h,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Login.routeName);
                },
                child: const Text(
                  "Already have an account?",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form == null) {
      return false;
    }
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
