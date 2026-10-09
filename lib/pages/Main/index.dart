import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Category/index.dart';
import 'package:hm_shop/pages/Home/index.dart';
import 'package:hm_shop/pages/Mine/index.dart';
import 'package:hm_shop/pages/Shopping/index.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Map<String, String>> _list = [
    {
      "icon": "lib/assets/home_normal.png",
      "active_icon": "lib/assets/home_active.png",
      "label": "主页",
    },
    {
      "icon": "lib/assets/classify_normal.png",
      "active_icon": "lib/assets/classify_active.png",
      "label": "分类",
    },
    {
      "icon": "lib/assets/shopping_normal.png",
      "active_icon": "lib/assets/shopping_active.png",
      "label": "购物车",
    },
    {
      "icon": "lib/assets/my_normal.png",
      "active_icon": "lib/assets/my_active.png",
      "label": "我的",
    },
  ];

  List<BottomNavigationBarItem> _getTabBarWidget() {
    return List.generate(_list.length, (int index) {
      Map<String, String> item = _list[index];
      return BottomNavigationBarItem(
        icon: Image.asset(item["icon"]!, width: 20, height: 20),
        activeIcon: Image.asset(item["active_icon"]!, width: 20, height: 20),
        label: item["label"],
      );
    });
  }

  List<Widget> _getChildren() {
    return [HomeView(), CategoryView(), ShoppingView(), MineView()];
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: _currentIndex, children: _getChildren()),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        items: _getTabBarWidget(),
        onTap: (int value) {
          _currentIndex = value;
          setState(() {});
        },
      ),
    );
  }
}
