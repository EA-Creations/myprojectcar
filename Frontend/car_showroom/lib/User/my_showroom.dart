import 'package:car_showroom/model/myshowroommodel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../common/urls.dart';

class MyShowroomsScreen extends StatefulWidget {
  const MyShowroomsScreen({super.key});
  @override
  State<MyShowroomsScreen> createState() => _MyShowroomsScreenState();
}

class _MyShowroomsScreenState extends State<MyShowroomsScreen> {
  final dio = Dio();

  TextEditingController reviewTxt = TextEditingController();

  final storage = const FlutterSecureStorage();
  MyShowroomModel? data;

  int rate = 0;

  void addReview({String? review, String? showid}) async {
    Map<String, String> allValues = await storage.readAll();

    String? userid = allValues["id"];

    var data = {
      "CustomerId": userid,
      "ShowroomId": showid,
      "Feedbacks": review,
      "Rating": rate
    };
    final response = await dio.post(Urls.addReviewShowroom, data: data);
    // print(data);

    if (response.statusCode == 201) {
      final snackBar = SnackBar(
        content: Text(response.data["msg"].toString()),
      );
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      // print(response.data);

      setState(() {});
      reviewTxt.clear();
    } else {
      throw Exception('Failed to load');
    }
  }

  void getLens() async {
    Map<String, String> allValues = await storage.readAll();

    String? userid = allValues["id"];
    final response =
        await dio.post(Urls.getMyShowroom, data: {"CustomerId": userid});

    if (response.statusCode == 201) {
      setState(() {});
      data = MyShowroomModel.fromJson(response.data);
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
            "My Showrooms",
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
                                  itemCount: data!.msg!.length,
                                  itemBuilder: (BuildContext ctx, index) {
                                    return InkWell(
                                      onTap: () {
                                        // push(
                                        //     context,
                                        //     CarListScreen(
                                        //         showroomid:
                                        //             data!.msg[index].id));
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
                                                  data!.msg![index].showroomId!
                                                      .showroomName!,
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
                                                                " Place : ${data!.msg![index].showroomId!.city!}",
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
                                                                      " Contact no : ${data!.msg![index].showroomId!.phone}",
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
                                                                      " Email : ${data!.msg![index].showroomId!.email}",
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
                                                    setState(() {});
                                                    showModalBottomSheet<void>(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return StatefulBuilder(
                                                            builder: (BuildContext
                                                                    context,
                                                                StateSetter
                                                                    setState /*You can rename this!*/) {
                                                          return ListView(
                                                            children: [
                                                              SizedBox(
                                                                height: 600,
                                                                // color: Colors.amber,
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Center(
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      // mainAxisSize:
                                                                      //     MainAxisSize
                                                                      //         .min,
                                                                      children: <Widget>[
                                                                        const Padding(
                                                                          padding:
                                                                              EdgeInsets.all(8.0),
                                                                          child: Text(
                                                                              " Add Review",
                                                                              softWrap: true,
                                                                              style: TextStyle(fontSize: 18, overflow: TextOverflow.clip)),
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              40,
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              80,
                                                                          child:
                                                                              Center(
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
                                                                                        color: rate > index ? const Color.fromARGB(255, 227, 198, 7) : Colors.black38,
                                                                                      ));
                                                                                }),
                                                                          ),
                                                                        ),
                                                                        TextField(
                                                                          controller:
                                                                              reviewTxt,
                                                                          decoration:
                                                                              const InputDecoration(hintText: 'Add Review'),
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              40,
                                                                        ),
                                                                        Center(
                                                                            child: ElevatedButton(
                                                                                onPressed: () {
                                                                                  print(reviewTxt.text.isNotEmpty);
                                                                                  reviewTxt.text.isNotEmpty ? addReview(review: reviewTxt.text, showid: data!.msg![index].showroomId!.sId) : print("enter anything");
                                                                                },
                                                                                child: const Text("Add")))
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        });
                                                      },
                                                    );
                                                  },
                                                  child:
                                                      const Text("Add Review")),
                                           
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
