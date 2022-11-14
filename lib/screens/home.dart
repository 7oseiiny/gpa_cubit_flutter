

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa/widget/button.dart';
import 'package:gpa/widget/text.dart';
import 'package:gpa/widget/textfield.dart';

import '../cubit/gpa_cubit.dart';

class Home extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

   Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GPA Calculator'),elevation: 10,shadowColor: Colors.blue),
      body: Container(
        height: 270,
        width: double.infinity,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text_(data: "enter number of subject"),
              TextFormField_(
                  validator: (value){
                    try {
                      int.parse(value);

                    }
                    catch(e){
                      return 'Please enter number only';
                    }
                  // }
                  return null;},
                  controller:BlocProvider.of<GpaCubit>(context).number_of_subject ,width: 200),
              Button_(data: 'next',onPressed: (){
                if (_formKey.currentState!.validate()){
                  Navigator.of(context).pushNamed('/CalculateOneTerm').then((value) => BlocProvider.of<GpaCubit>(context).rest());}
              },)
            ],
          ),
        ),
      ),
    );
  }
}
