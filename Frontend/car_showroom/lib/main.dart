//Flutter packages imports

import 'package:car_showroom/auth/signup.dart';
import 'package:car_showroom/showroom/add_car.dart';
import 'package:car_showroom/User/showrooms.dart';
import 'package:flutter/material.dart';
import 'package:car_showroom/auth/login.dart';

import 'User/home.dart';
import 'common/intro_slider.dart';
import 'showroom/home.dart';
// import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AutoConnect',
      theme: ThemeData(
          brightness: Brightness.light,
          androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
          scaffoldBackgroundColor: Colors.white70.withOpacity(.92),
          fontFamily: "SofiaProRegular",
          appBarTheme: const AppBarTheme(
              foregroundColor: Colors.black,
              // backgroundColor: Colors.black,
              centerTitle: true,
              color: Colors.white,
              titleTextStyle:
                  TextStyle(fontFamily: "SofiaProRegular", fontSize: 20))),
      home: const LoginScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/showroomhome': (context) => const HomeScreen(),
        '/userhome': (context) => const UserHomeScreen(),
        '/intro': (context) => const IntroScreen(),
        // '/forgotpassword': (context) => ForgotPasswordScreen(),
      },
    );
  }
}
