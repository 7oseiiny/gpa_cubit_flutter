import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa/widget/button.dart';
import 'package:gpa/widget/text.dart';
import 'package:gpa/widget/textfield.dart';

import '../cubit/gpa_cubit.dart';

class CalculateOneTerm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

   CalculateOneTerm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculate for one term"),
      ),
      body: Container(
        height: 350,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocConsumer<GpaCubit, GpaState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      return Text_(
                          data:
                              '   enter your mark of subject  ${BlocProvider.of<GpaCubit>(context).points.length + 1}  ');
                    },
                  ),
                  BlocConsumer<GpaCubit, GpaState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      return TextFormField_(
                        validator: (value){
                          try {
                            int.parse(value);

                          }
                          catch(e){
                            return 'Please enter number only';
                          }
                          // }
                          return null;},
                        focusnode: BlocProvider.of<GpaCubit>(context).focusnode,
                        enabled: BlocProvider.of<GpaCubit>(context).hours.length <
                                int.parse(BlocProvider.of<GpaCubit>(context)
                                    .number_of_subject
                                    .text)
                            ? true
                            : false,
                        controller: BlocProvider.of<GpaCubit>(context).mm,
                      );
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocConsumer<GpaCubit, GpaState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      return Text_(
                          data:
                              '   enter hours of subject  ${BlocProvider.of<GpaCubit>(context).hours.length + 1}  ');
                    },
                  ),
                  BlocConsumer<GpaCubit, GpaState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      return TextFormField_(
                        validator: (value){
                          try {
                            int.parse(value);

                          }
                          catch(e){
                            return 'Please enter number only';
                          }
                          // }
                          return null;},
                          enabled:
                              BlocProvider.of<GpaCubit>(context).hours.length <
                                      int.parse(BlocProvider.of<GpaCubit>(context)
                                          .number_of_subject
                                          .text)
                                  ? true
                                  : false,
                          controller: BlocProvider.of<GpaCubit>(context).hh);
                    },
                  ),
                ],
              ),
              BlocConsumer<GpaCubit, GpaState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return Text_(
                      data:
                          "your gpa is ${BlocProvider.of<GpaCubit>(context).gpa}");
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BlocConsumer<GpaCubit, GpaState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      return Button_(
                          data: "back",
                          onPressed: BlocProvider.of<GpaCubit>(context).back());
                    },
                  ),
                  BlocConsumer<GpaCubit, GpaState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      return Button_(
                        data: BlocProvider.of<GpaCubit>(context).hours.length <
                                int.parse(BlocProvider.of<GpaCubit>(context)
                                        .number_of_subject
                                        .text) -
                                    1
                            ? "next"
                            : "caculate",
                        onPressed: BlocProvider.of<GpaCubit>(context).hours.length <
                            int.parse(BlocProvider.of<GpaCubit>(context)
                                .number_of_subject
                                .text)?() {BlocProvider.of<GpaCubit>(context).calculate();} :null,
                      );
                    },
                  ),
                  Button_(
                    data: "rest",
                    onPressed: () {
                      BlocProvider.of<GpaCubit>(context).rest();
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
