

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
      appBar: AppBar(title: Text('GPA Calculator'),elevation: 10,shadowColor: Colors.blue,
      actions: [IconButton(onPressed: (){
        Navigator.of(context).pushNamed('/About');
      }, icon: Icon(Icons.more_vert))],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(25),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  spreadRadius: 10,

                )
              ],
              color: Colors.black12,
              borderRadius: BorderRadius.circular(25)
            ),
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
                      controller:BlocProvider.of<GpaCubit>(context).number_of_subject ),
                  Button_(data: 'next',onPressed: (){
                    if (_formKey.currentState!.validate()){
                      Navigator.of(context).pushNamed('/CalculateOneTerm').then((value) => BlocProvider.of<GpaCubit>(context).rest());}
                  },),
                ],
              ),
            ),
          ),
          TextButton(onPressed: (){Navigator.of(context).pushNamed('/HomeMore');}, child: Text("if you want to calculate total gpa of terms click here"))
        ],
      ),
    );
  }
}
