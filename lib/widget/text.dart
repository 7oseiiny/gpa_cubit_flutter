import 'package:flutter/material.dart';

class Text_ extends StatelessWidget {
  final String data;
  const Text_({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(data,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold));
  }
}
