import 'package:car_showroom/auth/login.dart';
import 'package:car_showroom/common/utils.dart';
import 'package:car_showroom/showroom/add_car.dart';
import 'package:car_showroom/showroom/my_customers.dart';
import 'package:car_showroom/showroom/profile.dart';
import 'package:car_showroom/showroom/service_requests.dart';
import 'package:car_showroom/showroom/test_drive.dart';
import 'package:car_showroom/showroom/widgets/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'booking.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Showroom",
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
                          FontAwesomeIcons.car,
                          size: 30,
                        ),
                        onPress: () {
                          push(context, const AddCarScreen());
                        },
                        title: "Add Car"),
                    // const Spacer(),
                    CategoryWidget(
                        widg: const FaIcon(
                          FontAwesomeIcons.peopleGroup,
                          size: 30,
                        ),
                        onPress: () {
                          push(context, const MyCustomers());
                        },
                        title: "My Customers"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CategoryWidget(
                        widg: const FaIcon(
                          FontAwesomeIcons.t,
                          size: 30,
                        ),
                        onPress: () {
                          push(context, const VerifyTestDrive());
                        },
                        title: "View Test Drives"),
                    CategoryWidget(
                        widg: const FaIcon(
                          FontAwesomeIcons.b,
                          size: 30,
                        ),
                        onPress: () {
                          push(context, const Booking());
                        },
                        title: "View Bookings"),
                    // const Spacer(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CategoryWidget(
                        widg: const FaIcon(
                          FontAwesomeIcons.codePullRequest,
                          size: 30,
                        ),
                        onPress: () {
                          push(context, const ServiceRequest());
                        },
                        title: "View Service Request"),
                    // const Spacer(),
                    CategoryWidget(
                        widg: const FaIcon(
                          FontAwesomeIcons.idCard,
                          size: 30,
                        ),
                        onPress: () {
                          push(context, const ProfileScreen());
                        },
                        title: "Profile"),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
