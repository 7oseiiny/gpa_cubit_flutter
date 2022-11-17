import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa/cubit/gpa_cubit.dart';
import 'package:gpa/screens/about.dart';
import 'package:gpa/screens/home.dart';
import 'package:gpa/screens/home_more.dart';

import 'screens/caculate_more_terms.dart';
import 'screens/calculat_one term.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GpaCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue,),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) =>  Home(),
          '/CalculateOneTerm': (context) =>  CalculateOneTerm(),
          '/CalculatemoreTerm': (context) =>  Caculate_more_terms(),
          '/HomeMore': (context) =>  HomeMore(),
          '/About': (context) =>  About(),
        },
      ),
    );
  }
}
