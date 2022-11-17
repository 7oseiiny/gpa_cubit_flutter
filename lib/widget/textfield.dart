import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/gpa_cubit.dart';

class TextFormField_ extends StatelessWidget {
  final bool? enabled;
  final TextEditingController? controller;
  final FocusNode? focusnode;
  final FormFieldValidator ?validator;
  const TextFormField_ ({Key? key, this.controller,  this.enabled=true, this.focusnode,  this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(            width:  MediaQuery.of(context).size.width*.40,
      height: MediaQuery.of(context).size.height*.05,

      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.06),
        child: Expanded(
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(
                color: enabled==true?Colors.blue:Colors.grey,
                spreadRadius: MediaQuery.of(context).size.width*.02,
                blurRadius: MediaQuery.of(context).size.width*.02
              )],
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator:validator ,
                focusNode: focusnode,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: MediaQuery.of(context).size.width*.06,color: Colors.blue),
                controller: controller,
                enabled:enabled ,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
