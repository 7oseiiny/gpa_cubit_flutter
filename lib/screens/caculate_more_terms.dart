import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/gpa_cubit.dart';
import '../widget/button.dart';
import '../widget/text.dart';
import '../widget/textfield.dart';

class Caculate_more_terms extends StatelessWidget {
  const Caculate_more_terms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculate for more "),
      ),
      body: Container(
        height: 350,
        child: Form(
          key: BlocProvider.of<GpaCubit>(context).formKeyMore,
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
                          '   enter gpa of term  ${BlocProvider.of<GpaCubit>(context).point_of_term_list.length + 1}  ');
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
                            double.parse(value);

                          }
                          catch(e){
                            return 'Please enter number only';
                          }
                          // }
                          return null;},
                        focusnode: BlocProvider.of<GpaCubit>(context).focusnodeMore,
                        enabled: BlocProvider.of<GpaCubit>(context).hours_of_term_list.length <
                            int.parse(BlocProvider.of<GpaCubit>(context)
                                .number_of_terms
                                .text)
                            ? true
                            : false,
                        controller: BlocProvider.of<GpaCubit>(context).gpa_of_term,
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
                          '   enter hours of term  ${BlocProvider.of<GpaCubit>(context).hours_of_term_list.length + 1}  ');
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
                              double.parse(value);

                            }
                            catch(e){
                              return 'Please enter number only';
                            }
                            // }
                            return null;},
                          enabled:
                          BlocProvider.of<GpaCubit>(context).hours_of_term_list.length <
                              int.parse(BlocProvider.of<GpaCubit>(context)
                                  .number_of_terms
                                  .text)
                              ? true
                              : false,
                          controller: BlocProvider.of<GpaCubit>(context).hours_of_term);
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
                      "your gpa is ${BlocProvider.of<GpaCubit>(context).gpaMore}");
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
                        data: BlocProvider.of<GpaCubit>(context).hours_of_term_list.length <
                            int.parse(BlocProvider.of<GpaCubit>(context)
                                .number_of_terms
                                .text) -
                                1
                            ? "next"
                            : "caculate",
                        onPressed: BlocProvider.of<GpaCubit>(context).hours_of_term_list.length <
                            int.parse(BlocProvider.of<GpaCubit>(context)
                                .number_of_terms
                                .text)?() {BlocProvider.of<GpaCubit>(context).calculate_more();} :null,
                      );
                    },
                  ),
                  Button_(data: "reset",
                    onPressed: () {
                      BlocProvider.of<GpaCubit>(context).restMore();
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
