import 'package:car_showroom/admin/showrooms.dart';
import 'package:car_showroom/admin/verify_showroom.dart';
import 'package:car_showroom/auth/login.dart';
import 'package:car_showroom/common/utils.dart';
import 'package:car_showroom/showroom/widgets/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  final storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Admin",
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    storage.deleteAll();
                    push(
                        context,
                        const LoginScreen(
                          intro: false,
                        ));
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.black,
                  ))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CategoryWidget(
                        widg: const FaIcon(
                          FontAwesomeIcons.check,
                          size: 30,
                        ),
                        onPress: () {
                          push(context, const VerifyShowrooms());
                        },
                        title: "Verify Showroom"),
                    // const Spacer(),
                    CategoryWidget(
                        widg: const FaIcon(
                          FontAwesomeIcons.peopleGroup,
                          size: 30,
                        ),
                        onPress: () {
                          push(context, const AdminShowroomListScreen());
                        },
                        title: "View Showroom"),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
