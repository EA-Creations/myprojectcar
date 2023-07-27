import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../model/car_list_model.dart';

class CarDetailsScrren extends StatefulWidget {
  final Msg carData;

  const CarDetailsScrren({
    Key? key,
    required this.carData,
  }) : super(key: key);
  @override
  State<CarDetailsScrren> createState() => _CarDetailsScrrenState();
}

class _CarDetailsScrrenState extends State<CarDetailsScrren> {
  // final dio = Dio();
  // CarListModel? data;
  // void getLens() async {
  //   final response =
  //       await dio.get(Urls.getCar, data: {"Showroom": widget.showroomid});

  //   if (response.statusCode == 201) {
  //     // print(response.data);
  //     setState(() {});
  //     data = CarListModel.fromJson(response.data);
  //   } else {
  //     throw Exception('Failed to load');
  //   }
  // }

  @override
  void initState() {
    // getLens();
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
            widget.carData.Carmodel,
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
                    child: Image.asset("assets/car.jpg"),
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
                                Text("Price : ${widget.carData.Price}",
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
                                      "Manufacturer : ${widget.carData.Manufacturer}",
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
                                      "Loan Availability  : ${widget.carData.Loan}",
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
                    "Warranty : ${widget.carData.Warranty}",
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
                    "Carspecs : ${widget.carData.Carspecs}",
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
                    "Milleage : ${widget.carData.Milleage}",
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
                    "Carspecs : ${widget.carData.Carspecs}",
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
                    "Colors : ${widget.carData.Colors}",
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
                    "Features : ${widget.carData.Features}",
                    softWrap: true,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                          const Size(double.infinity, 50)),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 10)),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'BOOK NOW',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
