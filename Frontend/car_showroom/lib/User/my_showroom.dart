import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MyShowroomScreen extends StatefulWidget {
  const MyShowroomScreen({super.key});

  @override
  State<MyShowroomScreen> createState() => _MyShowroomScreenState();
}

class _MyShowroomScreenState extends State<MyShowroomScreen> {
  final storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "My Showrooms",
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
                  "No Showrooms",
                  textScaleFactor: 1.3,
                ))
              ],
            ),
          )),
    );
  }
}
