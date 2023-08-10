import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:awesome_calendar/awesome_calendar.dart';
import '../common/urls.dart';
import '../model/car_list_model.dart' as carlist;
import '../model/review_model.dart';

class CarDetailsScrren extends StatefulWidget {
  final carlist.Msg carData;
  final String showroomid;

  const CarDetailsScrren({
    Key? key,
    required this.carData,
    required this.showroomid,
  }) : super(key: key);
  @override
  State<CarDetailsScrren> createState() => _CarDetailsScrrenState();
}

class _CarDetailsScrrenState extends State<CarDetailsScrren> {
  TextEditingController reviewTxt = TextEditingController();
  final dio = Dio();
  final storage = const FlutterSecureStorage();

  bool isBooked = false;
  bool isTest = false;
  int rate = 0;

  void bookCar() async {
    Map<String, String> allValues = await storage.readAll();

    String? userid = allValues["id"];

    final response = await dio.post(Urls.bookCar, data: {
      "ShowroomId": widget.showroomid,
      "CustomerId": userid,
      "CarId": widget.carData.sId,
      "BookingStatus": false
    });

    if (response.statusCode == 201) {
      final snackBar = SnackBar(
        content: Text(response.data["msg"].toString()),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      // print(response.data);
      isBooked = true;
      setState(() {});
    } else {
      throw Exception('Failed to load');
    }
  }

  void bookTest(String date) async {
    Map<String, String> allValues = await storage.readAll();

    String? userid = allValues["id"];

    final response = await dio.post(Urls.addTestDrive, data: {
      "ShowroomId": widget.showroomid,
      "CustomerId": userid,
      "CarId": widget.carData.sId,
      "Date": date,
      "TestDriveStatus": false
    });

    if (response.statusCode == 201) {
      isTest = true;
      final snackBar = SnackBar(
        content: Text(response.data["msg"].toString()),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      // print(response.data);
      isBooked = true;
      setState(() {});
    } else {
      throw Exception('Failed to load');
    }
  }

  void addReview(String review) async {
    Map<String, String> allValues = await storage.readAll();

    String? userid = allValues["id"];

    var data = {
      "CustomerId": userid,
      "CarId": widget.carData.sId,
      "Feedbacks": review,
      "Rating": rate
    };
    final response = await dio.post(Urls.addReview, data: data);
    // print(data);

    if (response.statusCode == 201) {
      final snackBar = SnackBar(
        content: Text(response.data["msg"].toString()),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      // print(response.data);

      getReview();
      setState(() {});
      reviewTxt.clear();
    } else {
      throw Exception('Failed to load');
    }
  }

  CarReview? reviewData;
  void getReview() async {
    // final response = await dio.get(Urls.getReviewOneCar, data: {"CarId": "64bf8c516b0545b38d1213c8"});
    final response = await dio
        .get(Urls.getReviewOneCar, data: {"CarId": widget.carData.sId});

    if (response.statusCode == 201) {
      // print(response.data);
      setState(() {});
      reviewData = CarReview.fromJson(response.data);
    } else {
      throw Exception('Failed to load');
    }
  }

  String? userType;
  getRole() async {
    Map<String, String> allValues = await storage.readAll();

    userType = allValues["UserType"];
  }

  @override
  void initState() {
    getRole();
    getReview();
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            widget.carData.carmodel!,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 300,
                    // child: Image.asset("assets/car.jpg"),
                    child: Image.memory(
                      base64Decode(widget.carData.carImage!.split(',')[1]),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Text("error"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const FaIcon(
                                  FontAwesomeIcons.dollarSign,
                                  size: 15,
                                ),
                                Text("Price : ${widget.carData.price}",
                                    // textAlign: TextAlign.center,

                                    softWrap: true,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    )),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Row(
                              children: [
                                Icon(
                                  Icons.rate_review_outlined,
                                  size: 19,
                                ),
                                Text(
                                  "Rating :  5 ",
                                  softWrap: true,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.precision_manufacturing,
                                      size: 18,
                                    ),
                                    Text(
                                      "Manufacturer : ${widget.carData.manufacturer}",
                                      softWrap: true,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.help_outline,
                                      size: 18,
                                    ),
                                    Text(
                                      "Loan Availability  : ${widget.carData.loan}",
                                      softWrap: true,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Warranty : ${widget.carData.warranty}",
                    softWrap: true,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Carspecs : ${widget.carData.carspecs}",
                    // textAlign: TextAlign.center,
                    softWrap: true,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Milleage : ${widget.carData.milleage}",
                    // textAlign: TextAlign.center,

                    softWrap: true,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Carspecs : ${widget.carData.carspecs}",
                    softWrap: true,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Colors : ${widget.carData.colors}",
                    softWrap: true,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Features : ${widget.carData.features}",
                    softWrap: true,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  userType != "User"
                      ? Container()
                      : ElevatedButton(
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                                const Size(double.infinity, 50)),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(vertical: 10)),
                          ),
                          onPressed: isTest
                              ? () {}
                              : () async {
                                  final DateTime? picked =
                                      await showDialog<DateTime>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const AwesomeCalendarDialog(
                                        selectionMode: SelectionMode.single,
                                      );
                                    },
                                  );

                                  if (picked != null) {
                                    setState(() {
                                      print(picked.toString().split(' ').first);
                                      bookTest(
                                          picked.toString().split(' ').first);
                                    });
                                  }
// picked != null ||
                                  // if (picked != null) {
                                  //   if (picked.isEmpty) {
                                  //     // print("isEmpty");
                                  //     showToast("Select Date");
                                  //   } else {
                                  //     String date =
                                  //         "${picked.first.toString().split(' ').first} to ${picked.last.toString().split(' ').first}";
                                  //     // print(date);

                                  //     whatsapp(
                                  //         "Name : ${ObjectFactory().appHive.getName()}  \nNumber : ${ObjectFactory().appHive.getPhoneNumber()} \nLocation : ${ObjectFactory().appHive.getLocation()} \nModel : ${carsData!.data[index].name} \nPrice : ${carsData!.data[index].price} rs \nDate : $date");
                                  //   }
                                  // }
                                },
                          child: Text(
                            isTest ? "DONE" : "TEST NOW",
                            style: const TextStyle(fontSize: 17),
                          ),
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  userType != "User"
                      ? Container()
                      : ElevatedButton(
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                                const Size(double.infinity, 50)),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(vertical: 10)),
                          ),
                          onPressed: isBooked
                              ? () {}
                              : () {
                                  bookCar();
                                },
                          child: Text(
                            isBooked ? "BOOKED" : "BOOK NOW",
                            style: const TextStyle(fontSize: 17),
                          ),
                        ),
                  const SizedBox(
                    height: 55,
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Reviews",
                        textScaleFactor: 2,
                      ),
                    ),
                  ),
                  reviewData == null
                      ? const Center(child: CircularProgressIndicator())
                      : reviewData!.msg!.isEmpty
                          ? const Center(
                              child: Padding(
                              padding: EdgeInsets.all(19.0),
                              child: Text("No Reviews"),
                            ))
                          : SizedBox(
                              height: 300,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: reviewData!.msg!.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      child: Card(
                                        //  color: Colors.white,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        )),
                                        elevation: 5,

                                        color: Colors.white,
                                        // color: Color.fromARGB(255, 204, 230, 241),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  const CircleAvatar(
                                                    radius: 13,
                                                    child: Icon(
                                                      Icons.person,
                                                      size: 15,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(reviewData!.msg![index]
                                                      .customerId!.name!),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  Card(
                                                    color: Colors.green,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              1.0),
                                                      child: Row(
                                                        children: [
                                                          Text(reviewData!
                                                              .msg![index]
                                                              .rating
                                                              .toString()),
                                                          const Icon(
                                                            Icons.star,
                                                            size: 14,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Text(reviewData!
                                                      .msg![index].feedbacks!),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                  SizedBox(
                    height: 80,
                    child: Center(
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          physics: const ScrollPhysics(),
                          itemBuilder: (context, index) {
                            return IconButton(
                                onPressed: () {
                                  setState(() {});
                                  if (rate == index + 1) {
                                    rate = 0;
                                    print(rate);
                                  } else {
                                    rate = index + 1;
                                    print(rate);
                                  }
                                },
                                icon: Icon(
                                  Icons.star,
                                  size: 30,
                                  color: rate > index
                                      ? const Color.fromARGB(255, 227, 198, 7)
                                      : Colors.black38,
                                ));
                          }),
                    ),
                  ),
                  userType != "User"
                      ? Container()
                      : TextField(
                          controller: reviewTxt,
                          decoration:
                              const InputDecoration(hintText: 'Add Review'),
                        ),
                  userType != "User"
                      ? Container()
                      : Center(
                          child: ElevatedButton(
                              onPressed: () {
                                print(reviewTxt.text.isNotEmpty);
                                reviewTxt.text.isNotEmpty
                                    ? addReview(reviewTxt.text)
                                    : print("enter anything");
                              },
                              child: const Text("Add")))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
