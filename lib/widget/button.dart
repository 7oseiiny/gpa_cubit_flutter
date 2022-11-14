import 'package:flutter/material.dart';

class Button_ extends StatelessWidget {
  final VoidCallback? onPressed;
  final String data;
  const Button_({Key? key, this.onPressed, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      disabledColor: Colors.blueGrey,
      onPressed: onPressed, color: Colors.blue,child: Text(data,style: TextStyle(fontSize: 20,color: Colors.white)),
    );
  }
}
