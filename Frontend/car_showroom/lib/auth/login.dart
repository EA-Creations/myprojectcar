// ignore_for_file: avoid_print

import 'package:car_showroom/service/auth/auth.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../common/utils.dart';
import '../showroom/not_verified.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  final bool? intro;
  const LoginScreen({super.key, this.intro});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    checkAuthentication();
    // TODO: implement initState
    super.initState();
  }

  final storage = const FlutterSecureStorage();

  Future<void> checkAuthentication() async {
    try {
      Map<String, String> allValues = await storage.readAll();
      print(allValues);
      if (allValues["token"] == null) {
        print("no tok");
        if (widget.intro != false) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/intro', (Route<dynamic> route) => false);
        }
      } else if (allValues["UserType"] == "User") {
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/userhome', (Route<dynamic> route) => false);
        print("User push");
      } else if (allValues["UserType"] == "Showroom") {
        print("showroom Verification true");
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/showroomhome', (Route<dynamic> route) => false);
      } else if (allValues["UserType"] == "Admin") {
        print("Admin");
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/adminHomeScreen', (Route<dynamic> route) => false);
      }
    } catch (e) {
      print(e);
    }
  }

  final _formKey = GlobalKey<FormState>();
  String? _email, _password;
  bool obscureText1 = true;
  showError(String content, String title) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                child: const Text("Ok"),
                onPressed: () {
                  // if (title == "Registration Successful") {
                  //   Navigator.pushNamed(context, '/login');
                  // } else {
                  Navigator.of(context).pop();
                  // }
                },
              )
            ],
          );
        });
  }

  _submitLogin() async {
    if (_formKey.currentState!.validate()) {
      print("Email: $_email Password: $_password");

      var user = {"Email": _email, "Password": _password};

      try {
        final Response? response = await AuthService().loginUser(user);

        if (response!.data["result"]["UserType"] == "User") {
          print("user");
          // Navigator.pushNamed(context, '/userhome');
          Navigator.pushNamedAndRemoveUntil(
              context, '/userhome', (route) => false);
        } else if (response.data["result"]["UserType"] == "Showroom") {
          print("showroom");
          if (response.data["result"]["Verification"] == true) {
            print("showroom Verification true");
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/showroomhome', (Route<dynamic> route) => false);
          } else {
            print("showroom Verification false");
            // print(response.data["result"]["Verification"]);
            storage.deleteAll();
            push(context, const NotVerified());
          }
        } else if (response.data["result"]["UserType"] == "Admin") {
          print("admin");
          // Navigator.pushNamed(context, '/showroomhome');
          Navigator.pushNamedAndRemoveUntil(
              context, '/adminHomeScreen', (route) => false);
        }
      } on DioError catch (e) {
        if (e.response != null) {
          print(e.response!.data);

          showError(e.response!.data["msg"], "Login Failed");
        } else {
          // Something happened in setting up or sending the request that triggered an Error
          showError("Error occured,please try againlater", "Oops");
        }
      }
    } else {
      print("Login Failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: const Color(0xFF000000),
              secondary: const Color(0xFFC0C0C0)),
        ),
        child: Scaffold(
          appBar: null,
          body: Padding(
              padding: const EdgeInsets.all(15),
              child: ListView(
                children: [
                  const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Image(
                    image: AssetImage('assets/login.png'),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            // label: const Text("uuabc@gmail.com"),
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email address';
                            } else if (!RegExp(
                                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(value)) {
                              return 'Enter valid email id';
                            } else {
                              setState(() {
                                _email = value;
                              });
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height *
                                .02), //SizedBox for Add space between Text Boxes
                        TextFormField(
                          obscureText: obscureText1,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.lock),
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscureText1 =
                                      !obscureText1; // toggle the value of obscureText
                                });
                              },
                              icon: Icon(obscureText1
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a password';
                              // }
                              // else if (!RegExp(
                              //         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                              //     .hasMatch(value)) {
                              //   return 'Password should have at least one uppercase letter, at least one lowercase letter at least one digit at least one special character and at least 8 characters.';
                            } else {
                              setState(() {
                                _password = value;
                              });
                            }
                            return null;
                          },
                        ),

                        SizedBox(
                            height: MediaQuery.of(context).size.height *
                                .02), //SizedBox for Add space between Text Boxes
                        ElevatedButton(
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                                const Size(double.infinity, 50)),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(vertical: 10)),
                          ),
                          onPressed: _submitLogin,
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 23),
                          ),
                        ),

                        SizedBox(
                            height: MediaQuery.of(context).size.height *
                                .02), //SizedBox for Add space between Text Boxes
                        // Center(
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       const Text(
                        //         'You don\'t remember your password?',
                        //         style: TextStyle(
                        //           fontSize: 15,
                        //           color: Colors.black,
                        //         ),
                        //       ),
                        //       GestureDetector(
                        //         onTap: () {
                        //           Navigator.pushNamed(
                        //               context, '/forgotpassword');
                        //         },
                        //         child: const Text(
                        //           'Reset Password',
                        //           style: TextStyle(
                        //               fontSize: 15,
                        //               fontWeight: FontWeight.bold,
                        //               color: Colors.blue),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height *
                                .02), //SizedBox for Add space between Text Boxes
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'You don\'t have account yet? ',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/signup');
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ));
  }
}
