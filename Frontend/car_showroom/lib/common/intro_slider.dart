import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<ContentConfig> listContentConfig = [];

  @override
  void initState() {
    super.initState();

    listContentConfig.add(
      const ContentConfig(
        title: "AutoConnect",
        description:
            "We provide an intuitive platform for car enthusiasts to effortlessly explore, compare, and customize their car shopping experience.",
        pathImage: "assets/intro1.png",
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        title: "AutoConnect",
        description:
            "The app aims to offer high-quality visuals, detailed specifications, and personalized recommendations to help users find their ideal car.",
        pathImage: "assets/intro2.png",
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        title: "AutoConnect",
        description:
            "In addition, it aims to cultivate a strong sense of community by enabling users to share their experiences and connect with fellow car enthusiasts.",
        pathImage: "assets/intro3.png",
      ),
    );
  }

  void onDonePress() {
    print("End of slides");
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(primary:Colors.white),
      ),
      child: IntroSlider(
        key: UniqueKey(),
        listContentConfig: listContentConfig,
        onDonePress: onDonePress,
        indicatorConfig: const IndicatorConfig(
        colorIndicator: Colors.grey,
        typeIndicatorAnimation: TypeIndicatorAnimation.sliding,
        colorActiveIndicator: Color.fromARGB(255, 255, 255, 255),
      ),
      ),
    );
  }
}
