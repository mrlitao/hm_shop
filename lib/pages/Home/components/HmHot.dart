import 'package:flutter/material.dart';

class HmHot extends StatefulWidget {
  const HmHot({super.key});

  @override
  State<HmHot> createState() => _HmHotState();
}

class _HmHotState extends State<HmHot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      alignment: .center,
      color: Colors.blueAccent,
      child: Text("Hot", style: TextStyle(color: Colors.white)),
    );
  }
}
