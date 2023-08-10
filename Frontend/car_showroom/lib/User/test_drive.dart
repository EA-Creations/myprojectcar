import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../common/urls.dart';
import '../model/test_drive_model.dart';

class TestDrive extends StatefulWidget {
  const TestDrive({
    Key? key,
  }) : super(key: key);
  @override
  State<TestDrive> createState() => _CarListScreenState();
}

class _CarListScreenState extends State<TestDrive> {
  final dio = Dio();
  TestDriveModel? data;
  
  final storage = const FlutterSecureStorage();
  void getTestDrive() async {
      Map<String, String> allValues = await storage.readAll();

    String? userid = allValues["id"];
    final response = await dio.get(Urls.getUserTestDrives,
        data: {"CustomerId": userid});

    if (response.statusCode == 201) {
      // print(response.data);
      setState(() {});
      data = TestDriveModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load');
    }
  }

  @override
  void initState() {
    getTestDrive();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Test Drive Status",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: SingleChildScrollView(
            child: data == null
                ? SizedBox(
                    height: 568,
                    child: Center(
                      child: LoadingAnimationWidget.staggeredDotsWave(
                        color: Colors.blue,
                        size: 50,
                      ),
                    ))
                : data!.msg.isEmpty
                    ? const SizedBox(
                        height: 500,
                        child: Center(
                            child: Text(
                          "No Test Drive Available",
                          textScaleFactor: 1.3,
                        )))
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: SizedBox(
                              child: ListView.builder(
                                  physics: const ScrollPhysics(),
                                  shrinkWrap: true,
                                  reverse: true,
                                  itemCount: data!.msg.length,
                                  itemBuilder: (BuildContext ctx, index) {
                                    return InkWell(
                                      onTap: () {
                                        // push(
                                        //     context,
                                        //     CarDetailsScrren(
                                        //         showroomid: widget.showroomid,
                                        //         carData: data!.msg[index]));
                                      },
                                      child: Card(
                                        //  color: Colors.white,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        )),
                                        elevation: 3,

                                        color: Colors.white,
                                        // color: Color.fromARGB(255, 204, 230, 241),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                  data!.msg[index].carId
                                                      .Carmodel,
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  softWrap: true,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 17,
                                                      overflow: TextOverflow
                                                          .ellipsis)),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                height: 150,
                                                child: Image.memory(
                                                  base64Decode(data!
                                                      .msg[index].carId.CarImage
                                                      .split(',')[1]),
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      const Text("error"),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const FaIcon(
                                                              FontAwesomeIcons
                                                                  .building,
                                                              size: 15,
                                                            ),
                                                            Text(
                                                                " Showroom : ${data!.msg[index].showroomId.ShowroomName}",
                                                                // textAlign: TextAlign.center,

                                                                softWrap: true,
                                                                style: const TextStyle(
                                                                    // fontWeight: FontWeight.bold,
                                                                    // fontSize: 13,
                                                                    )),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 8,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const FaIcon(
                                                              FontAwesomeIcons
                                                                  .calendar,
                                                              size: 15,
                                                            ),
                                                            Text(
                                                                " Date : ${data!.msg[index].Date}",
                                                                // textAlign: TextAlign.center,

                                                                softWrap: true,
                                                                style: const TextStyle(
                                                                    // fontWeight: FontWeight.bold,
                                                                    // fontSize: 13,
                                                                    )),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 8,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const FaIcon(
                                                              FontAwesomeIcons
                                                                  .mapLocation,
                                                              size: 15,
                                                            ),
                                                            Text(
                                                                " Place : ${data!.msg[index].showroomId.City}",
                                                                // textAlign: TextAlign.center,

                                                                softWrap: true,
                                                                style: const TextStyle(
                                                                    // fontWeight: FontWeight.bold,
                                                                    // fontSize: 13,
                                                                    )),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 8,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const FaIcon(
                                                              FontAwesomeIcons
                                                                  .dollarSign,
                                                              size: 15,
                                                            ),
                                                            Text(
                                                                " Status : ${(data!.msg[index].TestDriveStatus == true) ? "Test Accepted" : "Pending"}",
                                                                // textAlign: TextAlign.center,

                                                                softWrap: true,
                                                                style: const TextStyle(
                                                                    // fontWeight: FontWeight.bold,
                                                                    // fontSize: 13,
                                                                    )),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    // const Spacer(),
                                                    // const Row(
                                                    //   children: [
                                                    //     Column(
                                                    //       crossAxisAlignment:
                                                    //           CrossAxisAlignment
                                                    //               .start,
                                                    //       children: [
                                                    //         Row(
                                                    //           children: [
                                                    //             Icon(
                                                    //               Icons
                                                    //                   .precision_manufacturing,
                                                    //               size: 18,
                                                    //             ),
                                                    //             Text(
                                                    //                 " Manufacturer : {data!.msg[index].manufacturer}",
                                                    //                 softWrap:
                                                    //                     true,
                                                    //                 style:
                                                    //                     TextStyle()),
                                                    //           ],
                                                    //         ),
                                                    //         SizedBox(
                                                    //           height: 8,
                                                    //         ),
                                                    //         Row(
                                                    //           children: [
                                                    //             Icon(
                                                    //               Icons
                                                    //                   .help_outline,
                                                    //               size: 18,
                                                    //             ),
                                                    //             Text(
                                                    //                 " Loan Availability  : {data!.msg[index].loan}",
                                                    //                 softWrap:
                                                    //                     true,
                                                    //                 style:
                                                    //                     TextStyle()),
                                                    //           ],
                                                    //         ),
                                                    //     ],
                                                    //   ),
                                                    // ],
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ],
                      ),
          ),
        ),
      ),
    );
  }
}
