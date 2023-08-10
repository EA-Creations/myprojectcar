import 'dart:convert';

import 'package:car_showroom/model/serice_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../common/urls.dart';

class ServiceRequest extends StatefulWidget {
  const ServiceRequest({super.key});
  @override
  State<ServiceRequest> createState() => _BookingState();
}

class _BookingState extends State<ServiceRequest> {
  final dio = Dio();
  ServiceRequestModel? data;

  void updateBooking(String id) async {
    final response =
        await dio.post(Urls.updateService, data: {"ServiceId": id});

    if (response.statusCode == 201) {
      setState(() {});

      getRequest();
    } else {
      throw Exception('Failed to load');
    }
  }

  final storage = const FlutterSecureStorage();

  void getRequest() async {
    Map<String, String> allValues = await storage.readAll();

    String? userid = allValues["id"];
    final response =
        await dio.get(Urls.viewSerivceReq, data: {"ShowroomId": userid});

    if (response.statusCode == 201) {
      setState(() {});
      data = ServiceRequestModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load');
    }
  }

  @override
  void initState() {
    getRequest();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Verify Service Request",
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
                : data!.msg!.isEmpty
                    ? const SizedBox(
                        height: 500,
                        child: Center(
                            child: Text(
                          "No Service Requests",
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
                                  itemCount: data!.msg!.length,
                                  itemBuilder: (BuildContext ctx, index) {
                                    return InkWell(
                                      onTap: () {
                                        // push(
                                        //     context,
                                        //     CarListScreen(
                                        //         showroomid:
                                        //             data!.msg![index].sId!));
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
                                                  data!.msg![index].carId!
                                                      .carmodel!,
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
                                                  base64Decode(data!.msg![index]
                                                      .carId!.carImage!
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
                                                                  .person,
                                                              size: 15,
                                                            ),
                                                            Text(
                                                                " Customer Name : ${data!.msg![index].customerId!.name}",
                                                                // textAlign: TextAlign.center,

                                                                softWrap: true,
                                                                style:
                                                                    const TextStyle(
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  // fontWeight: FontWeight.bold,
                                                                  // fontSize: 11,
                                                                )),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 8,
                                                        ),
                                                        Row(
                                                          children: [
                                                            const Icon(
                                                              Icons.phone,
                                                              size: 19,
                                                            ),
                                                            Text(
                                                                " Phone : : ${data!.msg![index].customerId!.phone}",
                                                                softWrap: true,
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis)),
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
                                                                  .gear,
                                                              size: 15,
                                                            ),
                                                            Text(
                                                                " Issue : ${data!.msg![index].issueDescription!}",
                                                                // textAlign: TextAlign.center,

                                                                softWrap: true,
                                                                style:
                                                                    const TextStyle(
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  // fontWeight: FontWeight.bold,
                                                                  // fontSize: 11,
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
                                                                  .locationArrow,
                                                              size: 15,
                                                            ),
                                                            Text(
                                                                " Place : ${data!.msg![index].place!}",
                                                                // textAlign: TextAlign.center,

                                                                softWrap: true,
                                                                style:
                                                                    const TextStyle(
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  // fontWeight: FontWeight.bold,
                                                                  // fontSize: 11,
                                                                )),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            const Text(
                                                                "Accept Service Request"),
                                                            Switch(
                                                              onChanged:
                                                                  (value) async {
                                                                updateBooking(
                                                                    data!
                                                                        .msg![
                                                                            index]
                                                                        .sId!);
                                                              },
                                                              value: data!
                                                                  .msg![index]
                                                                  .serviceStatus!,
                                                              activeColor:
                                                                  Colors.green,
                                                              activeTrackColor:
                                                                  Colors.grey,
                                                              inactiveThumbColor:
                                                                  Colors
                                                                      .redAccent,
                                                              inactiveTrackColor:
                                                                  Colors.grey,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    const Spacer(),
                                                    // Container(
                                                    //   child: Row(
                                                    //     children: [
                                                    //       Column(
                                                    //         crossAxisAlignment:
                                                    //             CrossAxisAlignment
                                                    //                 .start,
                                                    //         children: [
                                                    //           Row(
                                                    //             children: [
                                                    //               const Icon(
                                                    //                 Icons.phone,
                                                    //                 size: 18,
                                                    //               ),
                                                    //               Text(
                                                    //                   " Contact no : ${data!.msg![index].Phone}",
                                                    //                   softWrap:
                                                    //                       true,
                                                    //                   style: const TextStyle(
                                                    //                       fontSize:
                                                    //                           12,
                                                    //                       overflow:
                                                    //                           TextOverflow.ellipsis)),
                                                    //             ],
                                                    //           ),
                                                    //           const SizedBox(
                                                    //             height: 8,
                                                    //           ),
                                                    //           Row(
                                                    //             children: [
                                                    //               const Icon(
                                                    //                 Icons.email,
                                                    //                 size: 18,
                                                    //               ),
                                                    //               Text(
                                                    //                   " Email : ${data!.msg![index].Email}",
                                                    //                   softWrap:
                                                    //                       true,
                                                    //                   style: const TextStyle(
                                                    //                       fontSize:
                                                    //                           11,
                                                    //                       overflow:
                                                    //                           TextOverflow.clip)),
                                                    //             ],
                                                    //           ),
                                                    //         ],
                                                    //       ),
                                                    //     ],
                                                    //   ),
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
