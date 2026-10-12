import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/Home.dart';

// 轮播图组件
class HmBanner extends StatefulWidget {
  final List<BannerItem> banners;
  const HmBanner({super.key, required this.banners});

  @override
  State<HmBanner> createState() => _HmBannerState();
}

class _HmBannerState extends State<HmBanner> {
  Widget _getBanners() {
    double width = MediaQuery.of(context).size.width;
    print("width=$width");
    return CarouselSlider(
      items: widget.banners.map((item) {
        return Image.network(item.imgUrl, fit: .cover, width: width);
      }).toList(),
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        height: 200,
        viewportFraction: 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getBanners()]);
  }
}
