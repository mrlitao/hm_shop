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
  bool isFouse = false;
  Positioned _getSearch() {
    return Positioned(
      left: 20,
      right: 20,
      top: 5,
      child: Padding(
        padding: .all(10),
        child: TextField(
          controller: TextEditingController(),
          style: TextStyle(color: Colors.amber),
          decoration: InputDecoration(
            hintText: isFouse ? "" : "搜索...",
            hintStyle: TextStyle(color: Colors.white),
            contentPadding: .all(10),
            filled: true,
            fillColor: Color.fromARGB(80, 0, 0, 0),
            border: OutlineInputBorder(borderRadius: .circular(8)),
          ),
          onTap: () {
            isFouse = true;
            setState(() {});
          },
          onTapOutside: (event) {
            isFouse = false;
            setState(() {});
          },
        ),
      ),
    );
  }

  int _currentIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  Positioned _getDot() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10,
      child: Row(
        mainAxisAlignment: .center,
        spacing: 10,
        children: List.generate(widget.banners.length, (index) {
          return GestureDetector(
            onTap: () {
              _controller.animateToPage(index);
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: 6,
              width: _currentIndex == index ? 40 : 20,
              decoration: BoxDecoration(
                borderRadius: .circular(3),
                color: _currentIndex == index
                    ? Colors.white
                    : Color.fromRGBO(0, 0, 0, 0.3),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _getBanners() {
    double width = MediaQuery.of(context).size.width;
    return CarouselSlider(
      carouselController: _controller,
      items: widget.banners.map((item) {
        return Image.network(item.imgUrl, fit: .cover, width: width);
      }).toList(),
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        height: 200,
        viewportFraction: 1,
        onPageChanged: (index, reason) {
          _currentIndex = index;
          setState(() {});
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getBanners(), _getSearch(), _getDot()]);
  }
}
