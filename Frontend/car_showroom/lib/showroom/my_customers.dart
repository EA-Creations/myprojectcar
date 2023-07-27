import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MyCustomersScreen extends StatefulWidget {
  const MyCustomersScreen({super.key});

  @override
  State<MyCustomersScreen> createState() => _MyCustomersScreenState();
}

class _MyCustomersScreenState extends State<MyCustomersScreen> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "My Customers",
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
          ),
          body: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Text(
                  "No Customers",
                  textScaleFactor: 1.3,
                ))
              ],
            ),
          )),
    );
  }
}
