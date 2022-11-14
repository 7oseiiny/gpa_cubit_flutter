import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/gpa_cubit.dart';

class TextFormField_ extends StatelessWidget {
  final bool? enabled;
  final double? width;
  final TextEditingController? controller;
  final FocusNode? focusnode;
  final FormFieldValidator ?validator;
  const TextFormField_ ({Key? key, this.controller,  this.enabled=true, this.width=100, this.focusnode,  this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: width,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(
            color: enabled==true?Colors.blue:Colors.grey,
            spreadRadius: 3,
            blurRadius: 5
          )],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 4,left: 5,right: 5),
          child: TextFormField(
            validator:validator ,
            focusNode: focusnode,
            keyboardType: TextInputType.number,
            style: TextStyle(fontSize: 20,color: Colors.blue),
            controller: controller,
            enabled:enabled ,
          ),
        ),
      ),
    );
  }
}
