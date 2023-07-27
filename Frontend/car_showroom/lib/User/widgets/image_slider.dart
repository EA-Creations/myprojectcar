import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomImageSlider extends StatefulWidget {
  // final List<String> sliderImages;
  const CustomImageSlider({
    super.key,
  });
  @override
  _CustomImageSliderState createState() => _CustomImageSliderState();
}

class _CustomImageSliderState extends State<CustomImageSlider> {
  List<String> sliderImageslocal = [
    "https://www.autocasa.in/slides/banner2.jpg",
    "https://www.carlo.in/assets/images/mercedes-benz-gls.jpg",
    "https://static.writearn.in/1682146385413_coolest-cars-feature_jpg.jpg",
    "https://robbreport.com/wp-content/uploads/2022/11/2-7.jpg?w=1000",
    "https://assets.mspimages.in/gear/wp-content/uploads/2023/01/Bugati.png",
    "https://www.lamborghini.com/sites/it-en/files/DAM/lamborghini/facelift_2019/homepage/families-gallery/2023/revuelto/revuelto_m.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Card(
      // color: MyThemes.lightbluish2,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(14),
      )),
      elevation: 8,
      child: Container(
          height: 200,
          decoration: const BoxDecoration(),
          child: CarouselSlider(
              items: sliderImageslocal
                  .map((item) => Container(
                        child: Center(
                            child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: CachedNetworkImage(
                            imageUrl: item,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                  // colorFilter: ColorFilter.mode(
                                  //     Colors.red, BlendMode.colorBurn
                                  //     )
                                ),
                              ),
                            ),
                            placeholder: (context, url) => SizedBox(
                              height: 59,
                              width: 50,
                              child: Center(
                                child: LoadingAnimationWidget.staggeredDotsWave(
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        )),
                      ))
                  .toList(),
              options: CarouselOptions(
                height: 400,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 400),
                autoPlayCurve: Curves.easeInOut,
                enlargeCenterPage: true,
                // onPageChanged: callbackFunction,
                scrollDirection: Axis.horizontal,
              ))),
    );
  }
}
