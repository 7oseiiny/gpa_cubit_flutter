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
  double gpa=0;
  double sum (List<double> x){
    double sum=0;
    for (var i = 0; i < x.length; i++) {
      sum += x[i];
    }
    return sum;
  }
  void check_number_of_subject(){

  }
  void calculate (){
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
}
