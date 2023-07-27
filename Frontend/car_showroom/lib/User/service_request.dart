import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserServiceRequestScreen extends StatefulWidget {
  const UserServiceRequestScreen({super.key});

  @override
  State<UserServiceRequestScreen> createState() =>
      _UserServiceRequestScreenState();
}

class _UserServiceRequestScreenState extends State<UserServiceRequestScreen> {
  final storage = const FlutterSecureStorage();

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
                  decoration: const InputDecoration(labelText: 'Title'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Title';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // Manufacturer = value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Subject'),
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
