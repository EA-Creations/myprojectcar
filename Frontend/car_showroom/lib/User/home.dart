import 'package:car_showroom/User/my_profile.dart';
import 'package:car_showroom/User/my_showroom.dart';
import 'package:car_showroom/User/service_request.dart';
import 'package:car_showroom/User/test_drive.dart';
import 'package:car_showroom/User/widgets/image_slider.dart';
import 'package:car_showroom/common/utils.dart';
import 'package:car_showroom/User/showrooms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../auth/login.dart';
import '../showroom/widgets/category_widget.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  final storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Customer",
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
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const CustomImageSlider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryWidget(
                        widg: const FaIcon(
                          FontAwesomeIcons.city,
                          size: 30,
                        ),
                        onPress: () {
                          push(context, const ShowroomListScreen());
                        },
                        title: "Showrooms"),
                    // const Spacer(),
                    CategoryWidget(
                        widg: const FaIcon(
                          FontAwesomeIcons.hotel,
                          size: 30,
                        ),
                        onPress: () {
                          push(context, const MyShowroomsScreen());
                        },
                        title: "My Showrooms"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryWidget(
                        widg: const FaIcon(
                          FontAwesomeIcons.heart,
                          size: 30,
                        ),
                        onPress: () {
                          push(context, const ServiceReques());
                        },
                        title: "Service Request"),
                    // const Spacer(),
                    CategoryWidget(
                        widg: const FaIcon(
                          FontAwesomeIcons.idCard,
                          size: 30,
                        ),
                        onPress: () {
                          push(context, const TestDrive());
                        },
                        title: "Test Drive Status"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const Spacer(),
                    CategoryWidget(
                        widg: const FaIcon(
                          FontAwesomeIcons.idCard,
                          size: 30,
                        ),
                        onPress: () {
                          push(context, const UserProfileScreen());
                        },
                        title: "My Profile"),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
