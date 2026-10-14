import 'package:flutter/material.dart';
import 'package:hm_shop/api/home.dart';
import 'package:hm_shop/pages/Home/components/HmBanner.dart';
import 'package:hm_shop/pages/Home/components/HmCategory.dart';
import 'package:hm_shop/pages/Home/components/HmHot.dart';
import 'package:hm_shop/pages/Home/components/HmMoreList.dart';
import 'package:hm_shop/pages/Home/components/HmSuggestion.dart';
import 'package:hm_shop/viewmodels/Home.dart';

// "https://img0.baidu.com/it/u=3743428635,4131989786&fm=253&app=138&f=JPEG?w=500&h=609",
// "https://img0.baidu.com/it/u=481937566,524912262&fm=253&app=138&f=JPEG?w=500&h=666",
// https://img0.baidu.com/it/u=3019991952,2457177883&fm=253&app=138&f=JPEG?w=500&h=919
// "https://img1.baidu.com/it/u=2367124595,512488347&fm=253&app=138&f=JPEG?w=500&h=500",
// "https://img1.baidu.com/it/u=3964913338,3595879013&fm=253&app=138&f=JPEG?w=500&h=639",
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<BannerItem> _banners = [
    // BannerItem(
    //   id: "1",
    //   imgUrl:
    //       "https://gips2.baidu.com/it/u=122592237,1590356808&fm=3074&app=3074&f=PNG?w=2560&h=1440",
    // ),
    // BannerItem(
    //   id: "2",
    //   imgUrl:
    //       "https://img2.baidu.com/it/u=1061400568,287117462&fm=253&app=120&f=JPEG?w=1422&h=800",
    // ),
    // BannerItem(
    //   id: "3",
    //   imgUrl:
    //       "https://img1.baidu.com/it/u=1429816280,399532766&fm=253&app=120&f=JPEG?w=1422&h=800",
    // ),
    // BannerItem(
    //   id: "4",
    //   imgUrl:
    //       "https://img1.baidu.com/it/u=3864742034,3939810037&fm=253&fmt=auto&app=120&f=JPEG?w=1422&h=800",
    // ),
  ];

  List<Widget> _getSliverChildren() {
    return [
      SliverToBoxAdapter(child: HmBanner(banners: _banners)),

      SliverToBoxAdapter(child: SizedBox(height: 10)),

      SliverToBoxAdapter(child: Hmcategory()),

      SliverToBoxAdapter(child: SizedBox(height: 10)),

      SliverToBoxAdapter(
        child: Padding(
          padding: .symmetric(horizontal: 10),
          child: HmSuggestion(),
        ),
      ),

      SliverToBoxAdapter(child: SizedBox(height: 10)),

      SliverToBoxAdapter(
        child: Padding(
          padding: .symmetric(horizontal: 10),
          child: Flex(
            spacing: 10,
            direction: .horizontal,
            children: [
              Expanded(child: HmHot()),
              Expanded(child: HmHot()),
            ],
          ),
        ),
      ),

      SliverToBoxAdapter(child: SizedBox(height: 10)),

      HmMoreList(),
    ];
  }

  @override
  void initState() {
    super.initState();
    _getBanners();
  }

  void _getBanners() async {
    _banners = await queryBanners();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(shrinkWrap: true, slivers: _getSliverChildren());
  }
}
