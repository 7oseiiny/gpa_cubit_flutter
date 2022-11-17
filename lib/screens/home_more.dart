

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa/widget/button.dart';
import 'package:gpa/widget/text.dart';
import 'package:gpa/widget/textfield.dart';

import '../cubit/gpa_cubit.dart';

class HomeMore extends StatelessWidget {
  final _formKeyMore = GlobalKey<FormState>();

  HomeMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GPA Calculator'),elevation: 10,shadowColor: Colors.blue),
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
              key: _formKeyMore,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text_(data: "enter number of terms"),
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
                      controller:BlocProvider.of<GpaCubit>(context).number_of_terms ),
                  Button_(data: 'next',onPressed: (){
                    if (_formKeyMore.currentState!.validate()){
                      Navigator.of(context).pushNamed('/CalculatemoreTerm').then((value) => BlocProvider.of<GpaCubit>(context).restMore());}
                  },),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
