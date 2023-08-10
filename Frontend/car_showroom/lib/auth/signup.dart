//import 'package:dio/dio.dart';
//flutter packages imports
import 'dart:convert';

import 'package:car_showroom/service/auth/auth.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

import '../common/utils.dart';
import 'login.dart';

//import 'services/authservice.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  final _UserFormKey = GlobalKey<FormState>();
  final _ShowRoomFormKey = GlobalKey<FormState>();

  String? _name,
      _email,
      _password,
      _confirmPassword,
      _house,
      _street,
      _district,
      __showroomdistrict,
      _showroomname,
      _managername,
      _showroomemail,
      _address,
      _showroomaddress,
      _showroomcity,
      _showroomstate,
      _state,
      _selectedImageName;
  int? _pincode, _showroompincode, _showroomphone, _phone;
  bool obscureText1 = true, obscureText2 = true;
  File? _selectedImage;
  XFile? _imageFile;
  //Authservice services = Authservice();
  Future<void> getImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = image;
    });
  }

  _SubmitSignUpUser() async {
    if (_UserFormKey.currentState!.validate()) {
      var user = {
        "Name": _name,
        "Email": _email,
        "Phone": _phone,
        "Address": _house,
        "City": _street,
        "State": _state,
        "District": _district,
        "Pincode": _pincode,
        "Password": _confirmPassword,
        "userType": "User"
      };
      // print(user);
      try {
        final Response response = await AuthService().registerUser(user);
        print(response);
        push(
            context,
            const LoginScreen(
              intro: false,
            ));
      } on DioError catch (e) {
        if (e.response != null) {
          print(e.response!.data);

          showError(e.response!.data["msg"], "SignUp Failed");
        } else {
          // Something happened in setting up or sending the request that triggered an Error
          // showError("Error occured,please try againlater", "Oops");
        }
      }
    }
  }

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

  _SubmitSignUpShowroom() async {
    List<String>? s = _imageFile?.path.toString().split("/");
    final bytes = await File(_imageFile!.path).readAsBytes();
    final base64 = base64Encode(bytes);
    var pic = "data:image/${s![s.length - 1].split(".")[1]};base64,$base64";

    if (_ShowRoomFormKey.currentState!.validate()) {
      var user = {
        "Name": _managername,
        "Email": _showroomemail,
        "Phone": _showroomphone,
        "Address": _showroomaddress,
        "City": _showroomcity,
        "State": _showroomstate,
        "District": __showroomdistrict,
        "Pincode": _showroompincode,
        "Password": _confirmPassword,
        "userType": "Showroom",
        "ShowroomName": _showroomname,
        "License": pic,
        "Verification": false
      };
      // print(user);
      try {
        final Response response =
            await AuthService().showroomRegisterUser(user);
        print(response);
        push(
            context,
            const LoginScreen(
              intro: false,
            ));
      } on DioError catch (e) {
        if (e.response != null) {
          print(e.response!.data);

          showError(e.response!.data["msg2"], "SignUp Failed");
        } else {
          // Something happened in setting up or sending the request that triggered an Error
          // showError("Error occured,please try againlater", "Oops");
        }
      }
    }
  }

  // Future<void> _selectImage() async {
  //   final picker = ImagePicker();
  //   final pickedImage = await picker.pickImage(source: ImageSource.gallery);

  //   if (pickedImage != null) {
  //     setState(() {
  //       _selectedImage = File(pickedImage.path);
  //       _selectedImageName = _selectedImage!.path.split('/').last;
  //     });
  //   }
  // }

  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    tabController.addListener(() {
      setState(() {
        _selectedIndex = tabController.index;
      });
      print("Selected Index: ${tabController.index}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: ListView(children: [
              const Center(
                child: Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have Account? ',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        push(
                            context,
                            const LoginScreen(
                              intro: false,
                            ));
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Welcome,',
                style: TextStyle(
                    fontSize: 38,
                    // fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const Text(
                'Create your account here',
                style: TextStyle(
                    fontSize: 20,
                    // fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 60,
                child: TabBar(
                  controller: tabController,
                  tabs: const [
                    Text('Customer', style: TextStyle(fontSize: 20)),
                    Text('Showroom', style: TextStyle(fontSize: 20)),
                  ],
                  indicatorColor: Colors.black,
                  indicatorWeight: 4.0,
                  labelColor: Colors.black,
                  unselectedLabelColor:
                      const Color.fromARGB(255, 135, 135, 135),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: tabController.index == 0 ? 1000 : 1300,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Container(
                        // height: MediaQuery.of(context).size.height * 1.05,
                        child: Form(
                          key: _UserFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .02),
                              //Name textfield
                              TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  labelText: 'Name',
                                  prefixIcon: Icon(Icons.person),
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your name';
                                  } else if (!RegExp(r'^[a-zA-Z ]+$')
                                      .hasMatch(value)) {
                                    return 'Name connot have numbers or symbols';
                                  } else {
                                    setState(() {
                                      _name = value;
                                    });
                                  }
                                  return null;
                                },
                                //  onSaved: (value) => _name = value,
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      .02), //SizedBox for Add space between Text Boxes
                              //Email textfield
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  labelText: 'Email',
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
                              //Phone textfield
                              TextFormField(
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  labelText: 'Phone',
                                  prefixIcon: Icon(Icons.phone),
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your phone number';
                                  } else if (!RegExp(r'^\+?[0-9]{10,12}$')
                                      .hasMatch(value)) {
                                    return 'Enter valid phone number';
                                  } else {
                                    setState(() {
                                      _phone = int.parse(value);
                                    });
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      .02), //SizedBox for Add space between Text Boxes
                              //House textfield
                              TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  labelText: 'House Address',
                                  prefixIcon: Icon(Icons.house),
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your House name';
                                  } else if (!RegExp(r'^[a-zA-Z ]+$')
                                      .hasMatch(value)) {
                                    return 'House name connot have numbers or symbols';
                                  } else {
                                    setState(() {
                                      _house = value;
                                    });
                                  }
                                  return null;
                                },
                                //  onSaved: (value) => _name = value,
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .02),
                              //Street textfield
                              TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  labelText: 'City',
                                  prefixIcon: Icon(Icons.streetview),
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your City';
                                  } else if (!RegExp(r'^[a-zA-Z ]+$')
                                      .hasMatch(value)) {
                                    return 'Street connot have numbers or symbols';
                                  } else {
                                    setState(() {
                                      _street = value;
                                    });
                                  }
                                  return null;
                                },
                                //  onSaved: (value) => _name = value,
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .02),
                              //District textfield
                              TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  labelText: 'District',
                                  prefixIcon: Icon(Icons.place),
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your District';
                                  } else if (!RegExp(r'^[a-zA-Z ]+$')
                                      .hasMatch(value)) {
                                    return 'District cannot have numbers or symbols';
                                  } else {
                                    setState(() {
                                      _district = value;
                                    });
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .02),

                              //Showroom State textfield
                              TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  labelText: 'State',
                                  prefixIcon: Icon(Icons.place),
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your State';
                                  } else if (!RegExp(r'^[a-zA-Z ]+$')
                                      .hasMatch(value)) {
                                    return 'State cannot have numbers or symbols';
                                  } else {
                                    setState(() {
                                      _state = value;
                                    });
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .02),
                              //Pincode textfield
                              TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'Pincode',
                                  prefixIcon: Icon(Icons.pin),
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your Pin code';
                                    // } else if (!RegExp(r'^[1-9][0-9]{5}$')
                                    //     .hasMatch(value)) {
                                    //   return 'Pin code connot have alphabets or symbols';
                                  } else {
                                    setState(() {
                                      _pincode = int.parse(value);
                                    });
                                  }
                                  return null;
                                },
                                //  onSaved: (value) => _name = value,
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .02),
                              const Divider(color: Colors.black),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .02),
                              //password textfields
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
                                // onSaved: (value) => _password = value,
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      .02), //SizedBox for Add space between Text Boxes
                              //Confirm password textfields
                              TextFormField(
                                obscureText: obscureText2,
                                decoration: InputDecoration(
                                  labelText: 'Confirm Password',
                                  prefixIcon: const Icon(Icons.lock),
                                  border: const OutlineInputBorder(),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        obscureText2 =
                                            !obscureText2; // toggle the value of obscureText
                                      });
                                    },
                                    icon: Icon(obscureText2
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please confirm your password';
                                    // } else if (!RegExp(
                                    //         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                    //     .hasMatch(value)) {
                                    //   return 'Password should have at least one uppercase letter, at least one lowercase letter at least one digit at least one special character and at least 8 characters.';
                                  } else if (value != _password) {
                                    print("Password $_password");
                                    print("Confirm Pass $value");
                                    return 'Passwords do not match';
                                  } else {
                                    setState(() {
                                      _confirmPassword = value;
                                    });
                                  }
                                  return null;
                                },
                                //  onSaved: (value) => _confirmPassword = value,
                              ),
                              const Spacer(),
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
                                onPressed: _SubmitSignUpUser,
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(fontSize: 23),
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        //height: MediaQuery.of(context).size.height * 1.07,
                        child: Form(
                          key: _ShowRoomFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .02),
                              //Showroom Name textfield
                              TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  labelText: 'Showroom Name',
                                  prefixIcon: Icon(Icons.shopify_outlined),
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter showroom name';
                                  } else if (!RegExp(r'^[a-zA-Z ]+$')
                                      .hasMatch(value)) {
                                    return 'Showroom name connot have numbers or symbols';
                                  } else {
                                    setState(() {
                                      _showroomname = value;
                                    });
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      .02), //SizedBox for Add space between Text Boxes
                              //Manager Name textfield
                              TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  labelText: 'Manager Name',
                                  prefixIcon: Icon(Icons.person),
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your name';
                                  } else if (!RegExp(r'^[a-zA-Z ]+$')
                                      .hasMatch(value)) {
                                    return 'Name connot have numbers or symbols';
                                  } else {
                                    setState(() {
                                      _managername = value;
                                    });
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      .02), //SizedBox for Add space between Text Boxes
                              //Showroom  Email textfield,
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  labelText: 'Showroom Email',
                                  prefixIcon: Icon(Icons.email),
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter showroom email address';
                                  } else if (!RegExp(
                                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                      .hasMatch(value)) {
                                    return 'Enter valid showroom email address';
                                  } else {
                                    setState(() {
                                      _showroomemail = value;
                                    });
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      .02), //SizedBox for Add space between Text Boxes
                              //Showroom Phone textfield
                              TextFormField(
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  labelText: 'Showroom Phone',
                                  prefixIcon: Icon(Icons.phone),
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter showroom phone number';
                                  } else if (!RegExp(r'^\+?[0-9]{10,12}$')
                                      .hasMatch(value)) {
                                    return 'Enter valid showroom phone number';
                                  } else {
                                    setState(() {
                                      _showroomphone = int.parse(value);
                                    });
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      .02), //SizedBox for Add space between Text Boxes
                              //Address textfield
                              TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  labelText: 'Address',
                                  prefixIcon: Icon(Icons.house),
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter address';
                                  } else if (!RegExp(r'^[a-zA-Z ]+$')
                                      .hasMatch(value)) {
                                    return 'Address connot have numbers or symbols';
                                  } else {
                                    setState(() {
                                      _showroomaddress = value;
                                    });
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .02),
                              //Showroom City textfield
                              TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  labelText: 'City',
                                  prefixIcon: Icon(Icons.streetview),
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your City';
                                  } else if (!RegExp(r'^[a-zA-Z ]+$')
                                      .hasMatch(value)) {
                                    return 'City connot have numbers or symbols';
                                  } else {
                                    setState(() {
                                      _showroomcity = value;
                                    });
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .02),
                              //Showroom State textfield
                              TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  labelText: 'District',
                                  prefixIcon: Icon(Icons.place),
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your District';
                                  } else if (!RegExp(r'^[a-zA-Z ]+$')
                                      .hasMatch(value)) {
                                    return 'State cannot have numbers or symbols';
                                  } else {
                                    setState(() {
                                      __showroomdistrict = value;
                                    });
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .02),

                              //Showroom State textfield
                              TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  labelText: 'State',
                                  prefixIcon: Icon(Icons.place),
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your State';
                                  } else if (!RegExp(r'^[a-zA-Z ]+$')
                                      .hasMatch(value)) {
                                    return 'State cannot have numbers or symbols';
                                  } else {
                                    setState(() {
                                      _showroomstate = value;
                                    });
                                  }
                                  return null;
                                },
                              ),

                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .02),
                              // Showroom Pincode textfield
                              TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'Pincode',
                                  prefixIcon: Icon(Icons.pin),
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your Pin code';
                                  } else if (!RegExp(r'^[1-9][0-9]{5}$')
                                      .hasMatch(value)) {
                                    return 'Pin code connot have alphabets or symbols';
                                  } else {
                                    setState(() {
                                      _showroompincode = int.parse(value);
                                    });
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      .02), //Business License
                              Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    /*if (_selectedImage != null)
              Image.file(
              _selectedImage!,
              height: 100,
              ),*/
                                    //SizedBox(height: 20),

                                    ElevatedButton(
                                      onPressed: getImageFromGallery,
                                      child: const Text('Select Image'),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .50,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .04,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Center(
                                          child: Text(
                                        _imageFile == null
                                            ? 'No image selected'
                                            : _imageFile!.name,
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      )),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .01),
                              const Divider(color: Color.fromRGBO(0, 0, 0, 1)),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .02),

                              //password textfields
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
                                    // } else if (!RegExp(
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
                                // onSaved: (value) => _password = value,
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      .02), //SizedBox for Add space between Text Boxes
                              //Confirm password textfields
                              TextFormField(
                                obscureText: obscureText2,
                                decoration: InputDecoration(
                                  labelText: 'Confirm Password',
                                  prefixIcon: const Icon(Icons.lock),
                                  border: const OutlineInputBorder(),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        obscureText2 =
                                            !obscureText2; // toggle the value of obscureText
                                      });
                                    },
                                    icon: Icon(obscureText2
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please confirm your password';
                                    // } else if (!RegExp(
                                    //         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                    //     .hasMatch(value)) {
                                    //   return 'Password should have at least one uppercase letter, at least one lowercase letter at least one digit at least one special character and at least 8 characters.';
                                  } else if (value != _password) {
                                    print("Password $_password");
                                    print("Confirm Pass $value");
                                    return 'Passwords do not match';
                                  } else {
                                    setState(() {
                                      _confirmPassword = value;
                                    });
                                  }
                                  return null;
                                },
                                //  onSaved: (value) => _confirmPassword = value,
                              ),
                              const Spacer(),
                              ElevatedButton(
                                style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(
                                      const Size(double.infinity, 50)),
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(vertical: 10)),
                                ),
                                onPressed: _SubmitSignUpShowroom,
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(fontSize: 23),
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
