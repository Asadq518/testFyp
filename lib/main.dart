import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/core/models/user_model.dart';
import 'package:fyp/provider/auth_provider/auth.provider.dart';
import 'package:fyp/provider/auth_provider/user_provider.dart';
import 'package:fyp/provider/pet_post_provider/pet_provider.dart';
import 'package:fyp/routes/app-routes.dart';

import 'package:fyp/shared_perefrences/shared_perefrences.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, 
      statusBarIconBrightness:
          Brightness.dark, 
    ));
    Future<UserModel> getUserData() => UserPreferences().getUser();
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (_) => PetProvider()),
          ChangeNotifierProvider(create: (_) => UserProvider()),
          // ChangeNotifierProvider(create: (_) => ProductService()),
        ],
        child: ScreenUtilInit(
          designSize: const Size(390, 844),
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'PET APP',
              theme: ThemeData(
                useMaterial3: false,
                appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.blue,
                ),
              ),
              // home: PetLostAddScreen()
              onGenerateRoute: MyRoute.onGeneratedRoute,
            );
          },
        ));
    // home: const BottomNavScreen(),
  }
}
