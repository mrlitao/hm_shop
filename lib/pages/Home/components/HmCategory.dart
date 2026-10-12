import 'package:flutter/material.dart';

class Hmcategory extends StatefulWidget {
  const Hmcategory({super.key});

  @override
  State<Hmcategory> createState() => _HmcategoryState();
}

class _HmcategoryState extends State<Hmcategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: .horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext content, int index) {
          return Container(
            width: 100,
            alignment: .center,
            margin: .symmetric(horizontal: 10),
            color: Colors.blueAccent,
            child: Text("分类-$index", style: TextStyle(color: Colors.white)),
          );
        },
      ),
    );
  }
}
