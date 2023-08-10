import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../common/urls.dart';

class UserServiceRequestScreen extends StatefulWidget {
  final String carId;
  final String showroomId;

  const UserServiceRequestScreen({
    Key? key,
    required this.carId,
    required this.showroomId,
  }) : super(key: key);

  @override
  State<UserServiceRequestScreen> createState() =>
      _UserServiceRequestScreenState();
}

class _UserServiceRequestScreenState extends State<UserServiceRequestScreen> {
  final storage = const FlutterSecureStorage();
  final dio = Dio();

  TextEditingController issueText = TextEditingController();

  TextEditingController placeTxtContoller = TextEditingController();
  void request({String? review, String? showid}) async {
    Map<String, String> allValues = await storage.readAll();

    String? userid = allValues["id"];

    var data = {
      "ShowroomId": widget.showroomId,
      "CustomerId": userid,
      "CarId": widget.carId,
      "IssueDescription": issueText.text,
      "Place": placeTxtContoller.text,
      "ServiceStatus": false
    };
    final response = await dio.post(Urls.serviceRequest, data: data);
    // print(data);

    if (response.statusCode == 201) {
      final snackBar = SnackBar(
        content: Text(response.data["msg"].toString()),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      // print(response.data);

      setState(() {});
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
              "Service Request",
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: issueText,
                  decoration: const InputDecoration(labelText: 'Issue'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Issue';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // Manufacturer = value;
                  },
                ),
                TextFormField(
                  controller: placeTxtContoller,
                  decoration: const InputDecoration(labelText: 'Place'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter subject';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // Manufacturer = value;
                  },
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (issueText.text.isNotEmpty ||
                          placeTxtContoller.text.isNotEmpty) {
                        request();
                      } else {
                        print("enter anything");
                      }
                      // submit();
                      // Do something with the form data
                    },
                    child: const Text('Request'),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
