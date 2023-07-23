//Flutter packages imports

import 'package:flutter/material.dart';
//Project dart file imports
import 'package:car_showroom/common/intro_slider.dart';
import 'package:car_showroom/common/login.dart';
import 'package:car_showroom/common/signup.dart';

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
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color.fromRGBO(0, 0, 0, 1),
          secondary: Color.fromARGB(255, 192, 192, 192),        
        )
      ),
      home: SignUpScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
       // '/forgotpassword': (context) => ForgotPasswordScreen(),
      },
    );
  }
}
