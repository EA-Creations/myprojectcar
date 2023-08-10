import 'package:car_showroom/common/utils.dart';
import 'package:car_showroom/User/widgets/car_list_screen.dart';
import 'package:car_showroom/model/accepeted_showroom.dart';
import 'package:car_showroom/model/showroomreviewmodel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../common/urls.dart';

class AdminShowroomListScreen extends StatefulWidget {
  const AdminShowroomListScreen({super.key});
  @override
  State<AdminShowroomListScreen> createState() =>
      _AdminShowroomListScreenState();
}

class _AdminShowroomListScreenState extends State<AdminShowroomListScreen> {
  final dio = Dio();
  AccepetedShowroomModel? data;

  ShowroomReview? reviewData;
  void getReview(String id) async {
    // final response = await dio.get(Urls.getReviewOneCar, data: {"CarId": "64bf8c516b0545b38d1213c8"});
    final response =
        await dio.get(Urls.getReviewOneShowroom, data: {"ShowroomId": id});
    // data: {"ShowroomId": "64c00a513da49b4aa64d5657"});

    if (response.statusCode == 201) {
      print(response.data);
      setState(() {});
      reviewData = ShowroomReview.fromJson(response.data);
    } else {
      throw Exception('Failed to load');
    }
  }

  void getLens() async {
    final response = await dio.get(Urls.getAccepted);

    if (response.statusCode == 201) {
      setState(() {});
      data = AccepetedShowroomModel.fromJson(response.data);
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
            "Showrooms List",
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
                                              TextButton(
                                                  onPressed: () {
                                                    reviewData = null;
                                                    getReview(
                                                        data!.msg[index].id);
                                                    setState(() {});
                                                    showModalBottomSheet<void>(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return reviewData ==
                                                                null
                                                            ? const Center(
                                                                child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            19.0),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    CircularProgressIndicator(),
                                                                    Text(
                                                                        "Loading click here to refresh"),
                                                                  ],
                                                                ),
                                                              ))
                                                            : StatefulBuilder(builder:
                                                                (BuildContext
                                                                        context,
                                                                    StateSetter
                                                                        setState /*You can rename this!*/) {
                                                                return ListView(
                                                                  children: [
                                                                    SizedBox(
                                                                      height:
                                                                          600,
                                                                      // color: Colors.amber,
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          // mainAxisSize:
                                                                          //     MainAxisSize
                                                                          //         .min,
                                                                          children: <Widget>[
                                                                            const Center(
                                                                              child: Padding(
                                                                                padding: EdgeInsets.all(8.0),
                                                                                child: Text(
                                                                                  "Reviews",
                                                                                  textScaleFactor: 2,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            reviewData!.msg!.isEmpty
                                                                                ? const Padding(
                                                                                    padding: EdgeInsets.all(8.0),
                                                                                    child: Text("No Reviews"),
                                                                                  )
                                                                                : SizedBox(
                                                                                    // height:
                                                                                    //     100,
                                                                                    child: ListView.builder(
                                                                                        shrinkWrap: true,
                                                                                        itemCount: reviewData!.msg!.length,
                                                                                        itemBuilder: (context, index) {
                                                                                          return Padding(
                                                                                            padding: const EdgeInsets.symmetric(vertical: 2),
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
                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                                                                        Text(reviewData!.msg![index].customerId!.name!),
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
                                                                                                            padding: const EdgeInsets.all(1.0),
                                                                                                            child: Row(
                                                                                                              children: [
                                                                                                                Text(reviewData!.msg![index].rating.toString()),
                                                                                                                const Icon(
                                                                                                                  Icons.star,
                                                                                                                  size: 14,
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Text(reviewData!.msg![index].feedbacks!),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        }),
                                                                                  ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              });
                                                      },
                                                    );
                                                  },
                                                  child: const Text(
                                                      "Check Reviews"))
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
