import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
part 'gpa_state.dart';

class GpaCubit extends Cubit<GpaState> {
  GpaCubit() : super(GpaInitial());

  List<double> points = [];
  List<double> hours = [];

  var mm =  TextEditingController();
  var hh =  TextEditingController();
  var number_of_subject =  TextEditingController();
  var focusnode =FocusNode();
  var formKey = GlobalKey<FormState>();

  double gpa=0;
  double sum (List<double> x){
    double sum=0;
    for (var i = 0; i < x.length; i++) {
      sum += x[i];
    }
    return sum;
  }
  void calculate (){
   if(formKey.currentState!.validate()){
     double m =double .parse(mm.text);
     double h=double.parse(hh.text);
     hours.add(h);
     if (m >= 0 && m < 50)
     { points.add(0 * h); }
     else if (m >= 50 && m < 60)
     { points.add(1.7 * h); }
     else if (m >= 60 && m < 65)
     { points.add(2 * h); }
     else if (m >= 65 && m < 70)
     { points.add(2.4 * h); }
     else if (m >= 70 && m < 75)
     { points.add(2.7 * h); }
     else if (m >= 75 && m < 80)
     { points.add(3 * h); }
     else if (m >= 80 && m < 85)
     { points.add(3.3 * h); }
     else if (m >= 85 && m < 90)
     { points.add(3.7 * h); }
     else if (m >= 90)
     { points.add(4 * h); }
     gpa = sum(points)/sum(hours);
     emit(GpaInitial());
     hh.clear();
     mm.clear();
     focusnode.requestFocus();
   }
  }
  void rest(){
    points.clear();
    hours.clear();
    mm.clear();
    hh.clear();
    gpa=0;
    emit(GpaInitial());
  }
  dynamic back(){
    if (hours.length==0){
      emit(GpaInitial());
    return null;
    }
    else{

      return (){points.removeLast();
      hours.removeLast();
      focusnode.requestFocus();
      emit(GpaInitial());};
    };

  }
  ///////////////////////////////////////////
  List<double> point_of_term_list = [];
  List<double> hours_of_term_list = [];
  double gpaMore=0;

  var formKeyMore = GlobalKey<FormState>();
  var focusnodeMore =FocusNode();

  var gpa_of_term =  TextEditingController();
  var hours_of_term =  TextEditingController();
  var number_of_terms =  TextEditingController();

  void calculate_more (){
    if(formKeyMore.currentState!.validate()){
      double g =double .parse(gpa_of_term.text);
      double h =double.parse(hours_of_term.text);
      point_of_term_list.add(g*h);
      hours_of_term_list.add(h);
      gpaMore = sum(point_of_term_list)/sum(hours_of_term_list);
      emit(GpaInitial());
      gpa_of_term.clear();
      hours_of_term.clear();
      focusnodeMore.requestFocus();
    }
  }
  void restMore(){
    gpa_of_term.clear();
    hours_of_term.clear();
    point_of_term_list.clear();
    hours_of_term_list.clear();
    gpaMore=0;
    emit(GpaInitial());
  }

}
