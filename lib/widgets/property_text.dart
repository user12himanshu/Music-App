import 'package:flutter/material.dart';

class PropertyText extends StatelessWidget {
  final String text;

  const PropertyText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
    );
  }
}
