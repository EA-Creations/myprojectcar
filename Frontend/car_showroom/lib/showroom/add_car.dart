import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../service/showroom/showroom_service.dart';

class AddCarScreen extends StatefulWidget {
  const AddCarScreen({super.key});

  @override
  State<AddCarScreen> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
  final _formKey = GlobalKey<FormState>();

  String? Carmodel;
  String? Manufacturer;
  String? Carspecs;
  String? Price;
  String? Milleage;
  String? Features;
  String? Color;
  String? Availability;
  String? Warranty;
  String? Loan;
  String? CarImage;
  ShowroomService service = ShowroomService();

  final storage = const FlutterSecureStorage();
  submit() async {
    Map<String, String> allValues = await storage.readAll();

    String? userid = allValues["id"];
    // print(userid);
    // List<String>? s=_imageFile?.path.toString().split("/");
    // final bytes=await File(_imageFile!.path).readAsBytes();
    // final base64=base64Encode(bytes);
    // var pic="data:image/"+s![s.length-1].split(".")[1]+";base64,"+base64;
    var data = {
      "Showroom": userid,
      "Carmodel": Carmodel,
      "Manufacturer": Manufacturer,
      "Carspecs": Carspecs,
      "Price": Price,
      "Milleage": Milleage,
      "Features": Features,
      "Colors": Color,
      "Availability": Availability,
      "Warranty": Warranty,
      "Loan": Loan,
      "CarImage": CarImage
    };
    try {
      final Response res = await service.addCar(data);
      print(res);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Car Added"),
              content: const Text("Car added successfully"),
              actions: [
                TextButton(
                  child: const Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        showError("Failed", "Failed");
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        showError("Error occured,please try againlater", "Oops");
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
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Add Car",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Form(
            key: _formKey,
            child: Column(
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
                  decoration: const InputDecoration(labelText: 'Model Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter car model';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    Carmodel = value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Manufacturer'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Manufacturer';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    Manufacturer = value;
                  },
                ),

                TextFormField(
                  decoration: const InputDecoration(labelText: 'Carspecs'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Carspecs';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    Carspecs = value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Price'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Price';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    Price = value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Milleage'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Milleage';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    Milleage = value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Features'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Features';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    Features = value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Colors'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Colors';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    Color = value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Availability'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Availability';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    Availability = value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Warranty'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Warranty';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    Warranty = value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Loan'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Loan';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    Loan = value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'CarImage'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter CarImage';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    CarImage = value;
                  },
                ),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        submit();
                        // Do something with the form data
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
