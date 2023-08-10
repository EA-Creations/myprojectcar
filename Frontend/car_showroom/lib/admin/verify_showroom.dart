import 'dart:convert';

import 'package:car_showroom/common/utils.dart';
import 'package:car_showroom/User/widgets/car_list_screen.dart';
import 'package:car_showroom/model/showroomreviewmodel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../common/urls.dart';
import '../model/showroom_model.dart';

class VerifyShowrooms extends StatefulWidget {
  const VerifyShowrooms({super.key});
  @override
  State<VerifyShowrooms> createState() => _VerifyShowroomsState();
}

class _VerifyShowroomsState extends State<VerifyShowrooms> {
  final dio = Dio();
  ShowroomModel? data;

  ShowroomReview? reviewData;
 

  void getShowrooms() async {
    final response = await dio.get(Urls.getAllShowroomAdmin);

    if (response.statusCode == 201) {
      setState(() {});
      data = ShowroomModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load');
    }
  }

  void updateShowroom(String id) async {
    final response =
        await dio.post(Urls.updateShowroom, data: {"ShowroomId": id});

    if (response.statusCode == 201) {
      setState(() {});
      print(response);

      getShowrooms();
    } else {
      throw Exception('Failed to load');
    }
  }

  @override
  void initState() {
    getShowrooms();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Verify Showrooms",
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
                          "No Showrooms Available",
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
                                        push(
                                            context,
                                            CarListScreen(
                                                showroomid:
                                                    data!.msg[index].id));
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
                                                  data!.msg[index].ShowroomName,
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
                                                child: Image.asset(
                                                    "assets/cars.jpg"),
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
                                                                  .city,
                                                              size: 15,
                                                            ),
                                                            Text(
                                                                " Place : ${data!.msg[index].City}",
                                                                // textAlign: TextAlign.center,

                                                                softWrap: true,
                                                                style:
                                                                    const TextStyle(
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  // fontWeight: FontWeight.bold,
                                                                  fontSize: 11,
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
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis)),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    const Spacer(),
                                                    Container(
                                                      child: Row(
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  const Icon(
                                                                    Icons.phone,
                                                                    size: 18,
                                                                  ),
                                                                  Text(
                                                                      " Contact no : ${data!.msg[index].Phone}",
                                                                      softWrap:
                                                                          true,
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          overflow:
                                                                              TextOverflow.ellipsis)),
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 8,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Icon(
                                                                    Icons.email,
                                                                    size: 18,
                                                                  ),
                                                                  Text(
                                                                      " Email : ${data!.msg[index].Email}",
                                                                      softWrap:
                                                                          true,
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              11,
                                                                          overflow:
                                                                              TextOverflow.clip)),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  TextButton(
                                                      onPressed: () {
                                                        showDialog<void>(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            print(data!
                                                                .msg[index]
                                                                .License);
                                                            //  data!
                                                            //             .msg[
                                                            //                 index]
                                                            //             .License ==
                                                            //         null
                                                            //     ? const Text(
                                                            //         'No image selected ')
                                                            //     :
                                                            return AlertDialog(
                                                              content:
                                                                  Container(
                                                                height: 200,
                                                                width: 300,
                                                                color: Colors
                                                                    .white,
                                                                child: Image
                                                                    .memory(
                                                                  base64Decode(data!
                                                                      .msg[
                                                                          index]
                                                                      .License
                                                                      .split(
                                                                          ',')[1]),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  errorBuilder: (context,
                                                                          error,
                                                                          stackTrace) =>
                                                                      const Text(
                                                                          "error"),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: const Text(
                                                          "View License")),
                                                  Row(
                                                    children: [
                                                      const Text("Verify"),
                                                      Switch(
                                                        onChanged:
                                                            (value) async {
                                                          updateShowroom(data!
                                                              .msg[index].id);
                                                        },
                                                        value: data!.msg[index]
                                                            .verification,
                                                        activeColor:
                                                            Colors.green,
                                                        activeTrackColor:
                                                            Colors.grey,
                                                        inactiveThumbColor:
                                                            Colors.redAccent,
                                                        inactiveTrackColor:
                                                            Colors.grey,
                                                      ),
                                                    ],
                                                  ),
                                                ],
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
