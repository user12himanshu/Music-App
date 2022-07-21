import 'package:flutter/material.dart';

class ErrorTextWidget extends StatelessWidget {
  const ErrorTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No network found',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
