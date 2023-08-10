import 'dart:convert';

import 'package:car_showroom/common/utils.dart';
import 'package:car_showroom/User/car_details.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../common/urls.dart';
import '../../model/car_list_model.dart';

class CarListScreen extends StatefulWidget {
  final String showroomid;
  const CarListScreen({
    Key? key,
    required this.showroomid,
  }) : super(key: key);
  @override
  State<CarListScreen> createState() => _CarListScreenState();
}

class _CarListScreenState extends State<CarListScreen> {
  final dio = Dio();
  CarListModel? data;
  void getLens() async {
    final response =
        await dio.get(Urls.getCar, data: {"Showroom": widget.showroomid});

    if (response.statusCode == 201) {
      // print(response.data);
      setState(() {});
      data = CarListModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load');
    }
  }

  @override
  void initState() {
    getLens();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Car List",
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
                          "No Cars Available",
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
                                        push(
                                            context,
                                            CarDetailsScrren(
                                                showroomid: widget.showroomid,
                                                carData: data!.msg![index]));
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
                                              Text(data!.msg![index].carmodel!,
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
                                                      .carImage!
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
                                                                  .dollarSign,
                                                              size: 15,
                                                            ),
                                                            Text(
                                                                " Price : ${data!.msg![index].price}",
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
                                                          children: [
                                                            const Icon(
                                                              Icons
                                                                  .rate_review_outlined,
                                                              size: 19,
                                                            ),
                                                            Text(
                                                                " Rating : ${index + 2} ",
                                                                softWrap: true,
                                                                style:
                                                                    const TextStyle()),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    const Spacer(),
                                                    Row(
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                const Icon(
                                                                  Icons
                                                                      .precision_manufacturing,
                                                                  size: 18,
                                                                ),
                                                                Text(
                                                                    " Manufacturer : ${data!.msg![index].manufacturer}",
                                                                    softWrap:
                                                                        true,
                                                                    style:
                                                                        const TextStyle()),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 8,
                                                            ),
                                                            Row(
                                                              children: [
                                                                const Icon(
                                                                  Icons
                                                                      .help_outline,
                                                                  size: 18,
                                                                ),
                                                                Text(
                                                                    " Loan Availability  : ${data!.msg![index].loan}",
                                                                    softWrap:
                                                                        true,
                                                                    style:
                                                                        const TextStyle()),
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
