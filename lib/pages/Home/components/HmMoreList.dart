import 'package:flutter/material.dart';

class HmMoreList extends StatefulWidget {
  const HmMoreList({super.key});

  @override
  State<HmMoreList> createState() => _HmMoreListState();
}

class _HmMoreListState extends State<HmMoreList> {
  @override
  Widget build(BuildContext context) {
    // return SliverGrid.builder(
    //   itemCount: 100,
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 2,
    //     mainAxisSpacing: 10,
    //     crossAxisSpacing: 10,
    //   ),
    //   itemBuilder: (BuildContext context, int index) {
    //     return Container(
    //       color: Colors.blue,
    //       alignment: .center,
    //       child: Text("aaaa", style: TextStyle(color: Colors.white)),
    //     );
    //   },
    // );
    return SliverPadding(
      padding: .all(10),
      sliver: SliverGrid.builder(
        itemCount: 100,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.blue,
            alignment: .center,
            child: Text("grid-$index", style: TextStyle(color: Colors.white)),
          );
        },
      ),
    );
  }
}
