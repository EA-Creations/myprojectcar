import 'package:car_showroom/common/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class NotVerified extends StatefulWidget {
  const NotVerified({super.key});

  @override
  State<NotVerified> createState() => _NotVerifiedState();
}

class _NotVerifiedState extends State<NotVerified> {
  final storage = const FlutterSecureStorage();
  @override
  void initState() {
    storage.deleteAll();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  "Oops",
                  textScaleFactor: 3,
                ),
              ),
              const Text(
                "Showroom Not Verified, Please Wait",
              ),
              TextButton(
                  onPressed: () {
                    pop(context);
                  },
                  child: const Text("Go Back")),
            ],
          ),
        ),
      ),
    );
  }
}
