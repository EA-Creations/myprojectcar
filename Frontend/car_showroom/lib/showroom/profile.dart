import 'package:car_showroom/model/profile_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../common/urls.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final storage = const FlutterSecureStorage();

  final dio = Dio();
  ProfileModel? data;
  @override
  void initState() {
    getProfile();
    // TODO: implement initState
    super.initState();
  }

  void getProfile() async {
    Map<String, String> allValues = await storage.readAll();

    String? userid = allValues["id"];
    final response =
        await dio.get(Urls.getShowroom, data: {"ShowroomId": userid});

    if (response.statusCode == 201) {
      print(response.data);
      setState(() {});
      data = ProfileModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Profile",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Form(
              key: _formKey,
              child: data == null
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Container(
                        //   alignment: Alignment.topLeft,
                        //   child: Row(
                        //     children: [
                        //       Text("Select land image"),
                        //       IconButton(onPressed: getImageFromCamera, icon: Icon(Icons.camera_alt,color: Colors.blue,)),
                        //       IconButton(onPressed: getImageFromGallery, icon: Icon(Icons.image,color: Colors.blue,))

                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   child: Card(
                        //     child: _imageFile == null
                        //         ? Text('No image selected ')
                        //         : Image.file(File(_imageFile!.path),width: 360,height:240 ,),
                        //   ),
                        // ),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Showroom Name'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter car model';
                            }
                            return null;
                          },
                          initialValue: data!.msg[0].ShowroomName,
                          readOnly: true,
                          onSaved: (value) {
                            // Carmodel = value;
                          },
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Manger Name'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter name';
                            }
                            return null;
                          },
                          initialValue: data!.msg[0].Name,
                          readOnly: true,
                          onSaved: (value) {
                            // Manufacturer = value;
                          },
                        ),

                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Email'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter email';
                            }
                            return null;
                          },
                          initialValue: data!.msg[0].Email,
                          readOnly: true,
                          onSaved: (value) {
                            // Carspecs = value;
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Phone'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter phone';
                            }
                            return null;
                          },
                          initialValue: data!.msg[0].Phone.toString(),
                          readOnly: true,
                          onSaved: (value) {
                            // Price = value;
                          },
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Address'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter address';
                            }
                            return null;
                          },
                          initialValue: data!.msg[0].Address,
                          readOnly: true,
                          onSaved: (value) {
                            // Milleage = value;
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'City'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter city';
                            }
                            return null;
                          },
                          initialValue: data!.msg[0].City,
                          readOnly: true,
                          onSaved: (value) {
                            // Features = value;
                          },
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'District'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter District';
                            }
                            return null;
                          },
                          initialValue: data!.msg[0].District,
                          readOnly: true,
                          onSaved: (value) {
                            // Color = value;
                          },
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Pincode'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter pincode';
                            }
                            return null;
                          },
                          initialValue: data!.msg[0].Pincode.toString(),
                          readOnly: true,
                          onSaved: (value) {
                            // Availability = value;
                          },
                        ),
                        // TextFormField(
                        //   decoration: const InputDecoration(labelText: 'Warranty'),
                        //   validator: (value) {
                        //     if (value == null || value.isEmpty) {
                        //       return 'Please enter Warranty';
                        //     }
                        //     return null;
                        //   },
                        //   onSaved: (value) {
                        //     Warranty = value;
                        //   },
                        // ),
                        // TextFormField(
                        //   decoration: const InputDecoration(labelText: 'Loan'),
                        //   validator: (value) {
                        //     if (value == null || value.isEmpty) {
                        //       return 'Please enter Loan';
                        //     }
                        //     return null;
                        //   },
                        //   onSaved: (value) {
                        //     Loan = value;
                        //   },
                        // ),
                        // TextFormField(
                        //   decoration: const InputDecoration(labelText: 'CarImage'),
                        //   validator: (value) {
                        //     if (value == null || value.isEmpty) {
                        //       return 'Please enter CarImage';
                        //     }
                        //     return null;
                        //   },
                        //   onSaved: (value) {
                        //     CarImage = value;
                        //   },
                        // ),
                        const SizedBox(height: 20),
                        // Center(
                        //   child: ElevatedButton(
                        //     onPressed: () {
                        //       if (_formKey.currentState!.validate()) {
                        //         _formKey.currentState!.save();
                        //         // submit();
                        //         // Do something with the form data
                        //       }
                        //     },
                        //     child: const Text('Update'),
                        //   ),
                        // ),
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}
