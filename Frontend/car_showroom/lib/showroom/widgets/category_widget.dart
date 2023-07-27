import 'package:car_showroom/common/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryWidget extends StatelessWidget {
  final String title;
  final Widget widg;
  final Function onPress;
  const CategoryWidget({
    super.key,
    required this.title,
    required this.onPress, required this.widg,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        onPress();
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
        child: SizedBox(
          height: screenHeight(context) / 5,
          width: screenWidth(context) / 2.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             widg,
              Text(title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  softWrap: true,
                  style: const TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 15,
                      overflow: TextOverflow.ellipsis)),
            ],
          ),
        ),
      ),
    );
  }
}
