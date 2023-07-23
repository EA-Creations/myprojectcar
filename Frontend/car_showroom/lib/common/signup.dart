import 'dart:convert';

//import 'package:dio/dio.dart';
//flutter packages imports
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
//import 'services/authservice.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _UserFormKey = GlobalKey<FormState>();
  final _ShowRoomFormKey = GlobalKey<FormState>();
  String? _name,
      _phone,
      _email,
      _password,
      _confirmPassword,
      _house,
      _street,
      _district,
      _showroomname,
      _managername,
      _showroomemail,
      _showroomphone,
      _address,
      _showroomcity,
      _showroomcountry,
      _selectedImageName;
  int? _pincode, _showroompincode;
  bool obscureText1 = true, obscureText2 = true;
  File? _selectedImage;
  //Authservice services = Authservice();

  _SubmitSignUpUser() async {
    if (_UserFormKey.currentState!.validate()) {
     /* var user = jsonEncode({
        "name": _name,
        "email": _email,
        "phone": _phone,
        "password": _confirmPassword,
        "usertype": "Customer"
      });*/
     // print(user);
      /* try{
        final Response response =await services.RegisterUser(user);
        print(response);
        Navigator.pushNamed(context, "/login");
      }on DioError catch(e) {
        print(e);
        
      }*/
    }
  }

  _SubmitSignUpShowroom() async {
    if (_ShowRoomFormKey.currentState!.validate()) {
      var user = jsonEncode({
        "name": _name,
        "email": _email,
        "phone": _phone,
        "password": _confirmPassword,
        "usertype": "Customer"
      });
      print(user);
      /* try{
        final Response response =await services.RegisterUser(user);
        print(response);
        Navigator.pushNamed(context, "/login");
      }on DioError catch(e) {
        print(e);
        
      }*/
    }
  }

Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
        _selectedImageName = _selectedImage!.path.split('/').last;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Scaffold(
             
            body: SingleChildScrollView(
              child: Column(
                children: [
                    Center(
                    child: Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .01,
                          bottom: MediaQuery.of(context).size.height * .02),
                      width: MediaQuery.of(context).size.height * .20,
                      height: MediaQuery.of(context).size.height * .08,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                        gradient: LinearGradient(
                          colors: [Colors.black, Colors.black, Colors.black],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have Account? ',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .04),
                  RichText(
                    text: TextSpan(
                      text: 'Welcome,\n',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Create your account here',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontStyle: FontStyle.italic,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(height: 60,
                    child: const TabBar(
                    tabs: [
                      Text('Customer', style: TextStyle(fontSize: 20)),
                    Text('Showroom', style: TextStyle(fontSize: 20)),
                ], indicatorColor: Colors.black,
                    indicatorWeight: 4.0,
                    labelColor: Colors.black,
                    unselectedLabelColor: Color.fromARGB(255, 135, 135, 135),
                ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container( height:1200, 
                      child:   TabBarView(
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
                              decoration: InputDecoration(
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
                              decoration: InputDecoration(
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
                              decoration: InputDecoration(
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
                                    _phone = value;
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
                              decoration: InputDecoration(
                                labelText: 'House',
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
                              decoration: InputDecoration(
                                labelText: 'Street',
                                prefixIcon: Icon(Icons.streetview),
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your Street';
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
                              decoration: InputDecoration(
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
                            //Pincode textfield
                            TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
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
                            Divider(color: Colors.black),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .02),
                            //password textfields
                            TextFormField(
                              obscureText: obscureText1,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder(),
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
                                } else if (!RegExp(
                                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                    .hasMatch(value)) {
                                  return 'Password should have at least one uppercase letter, at least one lowercase letter at least one digit at least one special character and at least 8 characters.';
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
                                prefixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder(),
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
                                } else if (!RegExp(
                                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                    .hasMatch(value)) {
                                  return 'Password should have at least one uppercase letter, at least one lowercase letter at least one digit at least one special character and at least 8 characters.';
                                } else if (value != _password) {
                                  print("Password " + _password.toString());
                                  print("Confirm Pass " + value);
                                  return 'Passwords do not match';
                                } else {
                                  setState(() {
                                    _confirmPassword = value;
                                  });
                                }
                                return null;
                              },
                              //  onSaved: (value) => _confirmPassword = value,
                            ),Spacer(),
                            SizedBox(
                                height: MediaQuery.of(context).size.height *
                                    .02), //SizedBox for Add space between Text Boxes
                            ElevatedButton(
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(
                                    Size(double.infinity, 50)),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(vertical: 10)),
                              ),
                              onPressed: _SubmitSignUpUser,
                              child: Text(
                                'Sign Up',
                                style: TextStyle(fontSize: 23),
                              ),
                            ),Spacer(),
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
                              decoration: InputDecoration(
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
                              decoration: InputDecoration(
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
                              decoration: InputDecoration(
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
                              decoration: InputDecoration(
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
                                    _showroomphone = value;
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
                              decoration: InputDecoration(
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
                                    _address = value;
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
                              decoration: InputDecoration(
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
                              decoration: InputDecoration(
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
                                    _showroomcountry = value;
                                  });
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .02),
                            //Showroom Country textfield
                            TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: 'Country',
                                prefixIcon: Icon(Icons.place),
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your Country';
                                } else if (!RegExp(r'^[a-zA-Z ]+$')
                                    .hasMatch(value)) {
                                  return 'Country cannot have numbers or symbols';
                                } else {
                                  setState(() {
                                    _showroomcountry = value;
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
                              decoration: InputDecoration(
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
                                height:
                                    MediaQuery.of(context).size.height * .02),                    //Business License  
                            Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        /*if (_selectedImage != null)
              Image.file(
              _selectedImage!,
              height: 100,
              ),*/
                        //SizedBox(height: 20),
                        
                        ElevatedButton(
              onPressed: _selectImage,
              child: Text('Select Image'),
                        ),
                        Container(
              width: MediaQuery.of(context).size.width * .56,
              height: MediaQuery.of(context).size.height * .04,
              decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 2), borderRadius: BorderRadius.circular(4)),
              child: Center(child: Text(
              _selectedImageName ?? 'No image selected',
              style: TextStyle(fontSize: 16, ),
              )),
                        )
                        
                      ],
                    ),
                ), 
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .01),
                            Divider(color: Color.fromRGBO(0, 0, 0, 1)),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .02),
                         
                            //password textfields
                            TextFormField(
                              obscureText: obscureText1,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder(),
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
                                } else if (!RegExp(
                                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                    .hasMatch(value)) {
                                  return 'Password should have at least one uppercase letter, at least one lowercase letter at least one digit at least one special character and at least 8 characters.';
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
                                prefixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder(),
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
                                } else if (!RegExp(
                                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                    .hasMatch(value)) {
                                  return 'Password should have at least one uppercase letter, at least one lowercase letter at least one digit at least one special character and at least 8 characters.';
                                } else if (value != _password) {
                                  print("Password " + _password.toString());
                                  print("Confirm Pass " + value);
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
                            SizedBox(
                                height: MediaQuery.of(context).size.height *
                                    .02), //SizedBox for Add space between Text Boxes
                            ElevatedButton(
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(
                                    Size(double.infinity, 50)),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(vertical: 10)),
                              ),
                              onPressed: _SubmitSignUpShowroom,
                              child: Text(
                                'Sign Up',
                                style: TextStyle(fontSize: 23),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                ],
              ),),
                  ), ],
                    ),
               
             
            ),
          ),
        ),
      );
  }
}