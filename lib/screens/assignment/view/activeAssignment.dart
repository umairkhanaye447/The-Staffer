import 'dart:ffi';
import 'package:TheStafferEmployee/screens/assignment/assignment_bloc/assignment_bloc.dart';
import 'package:TheStafferEmployee/screens/assignment/assignment_bloc/assignment_event.dart';
import 'package:TheStafferEmployee/screens/assignment/assignment_bloc/assignment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../constants/AppformateModel.dart';
import '../Model/assignment_model/assignmentapiModel.dart';
import 'assignmentdetail.dart';
import 'package:TheStafferEmployee/style/theme.dart' as Style;

class Activeassignment extends StatefulWidget {
  @override
  _ActiveassignmentState createState() => _ActiveassignmentState();
}

class _ActiveassignmentState extends State<Activeassignment> {
  String valueexist = "";

  @override
  void initState() {
    // TODO: implement initState
    print('hellow assignment');
    super.initState();
    context.read<AssignmentBloc>().add(GetAssignmentDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    String apiDateFormat = "MMMM d,yyyy";
    return Scaffold(body: BlocBuilder<AssignmentBloc, AssignmentState>(
      builder: (context, state) {
        if (state is AssignmentLoadingState) {
          print('Active assignment is loading');
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AssignmentErrorState) {
          print('Assignment data error');
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${state.message}'),
                if (state.message == 'No assignments available.')
                  Text('Please check back later.'),
              ],
            ),
          );
        } else if (state is AssignmentLoadedState) {
          print('Assignment loaded');
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: SingleChildScrollView(
                    physics: const ScrollPhysics(),
                    child: Column(
                      children: <Widget>[
                        if (state.assignmentResponse.data.isNotEmpty)
                          for (int i = 0;
                              i < state.assignmentResponse.data.length;
                              i++)
                            Container(
                              child: _checkexist(
                                  state.assignmentResponse.data[i].empStatus,
                                  state.assignmentResponse.data[i].jobId),
                            ),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.assignmentResponse.data.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  if (state.assignmentResponse.data[index]
                                          .empStatus ==
                                      'Active')
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 10, 20, 5),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  Assignmentdetail(
                                                jobid: state.assignmentResponse
                                                    .data[index].jobId,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                255, 255, 255, 1),
                                            border: Border.all(
                                                color: const Color.fromRGBO(
                                                    79, 171, 247, 1)),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 0, 10, 0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8),
                                                      child: Container(
                                                        child: Text(
                                                          state
                                                                  .assignmentResponse
                                                                  .data[index]
                                                                  .jobPosition ??
                                                              ' ',
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      19.0),
                                                        ),
                                                      ),
                                                    ),
                                                    Image.asset(
                                                      "images/Path 58358@2x.png",
                                                      height: 15,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20),
                                                child: Container(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    state
                                                            .assignmentResponse
                                                            .data[index]
                                                            .customer ??
                                                        '',
                                                    style: const TextStyle(
                                                        color: Color.fromRGBO(
                                                            112, 112, 112, 1),
                                                        fontSize: 10.0),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        18, 0, 20, 0),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .baseline,
                                                        textBaseline:
                                                            TextBaseline
                                                                .alphabetic,
                                                        children: [
                                                          const Text(
                                                              "Start Date ",
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          112,
                                                                          112,
                                                                          112,
                                                                          1),
                                                                  fontSize:
                                                                      10.0)),
                                                          const SizedBox(
                                                            height: 2,
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              state
                                                                          .assignmentResponse
                                                                          .data[
                                                                              index]
                                                                          .startDate !=
                                                                      null
                                                                  ? DateFormat(state
                                                                          .formateResponse
                                                                          .data[
                                                                              0]
                                                                          .currentDateFormat)
                                                                      .format(state
                                                                          .assignmentResponse
                                                                          .data[
                                                                              index]
                                                                          .startDate)
                                                                  : ' - - - ',
                                                              style: const TextStyle(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          1),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      14.0),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 60),
                                                      child: Container(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .baseline,
                                                          textBaseline:
                                                              TextBaseline
                                                                  .alphabetic,
                                                          children: [
                                                            const Text(
                                                                "End Date",
                                                                style: TextStyle(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            112,
                                                                            112,
                                                                            112,
                                                                            1),
                                                                    fontSize:
                                                                        10.0)),
                                                            const SizedBox(
                                                              height: 2,
                                                            ),
                                                            Container(
                                                              child: Text(
                                                                state.assignmentResponse.data[index].endDate !=
                                                                            null &&
                                                                        state
                                                                            .assignmentResponse
                                                                            .data[
                                                                                index]
                                                                            .endDate
                                                                            .isNotEmpty
                                                                    ? DateFormat(state
                                                                            .formateResponse
                                                                            .data[
                                                                                0]
                                                                            .currentDateFormat)
                                                                        .format(DateFormat(apiDateFormat).parse(state
                                                                            .assignmentResponse
                                                                            .data[index]
                                                                            .endDate))
                                                                    : ' - - - ',
                                                                style:
                                                                    const TextStyle(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          1),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      14.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  else
                                    Container(),
                                ],
                              );
                            }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: Text('Unexpected state: $state'),
          );
        }
      },
    ));
  }

  _checkexist(var value, var value2) {
    print('yyyyyyyyyyyyyy$value yyyyyyyyy $value2');
    // valueexist
    if (value == "Active") {
      print('aaaaaaaaaaaa');
      valueexist = "qqqqqq".toString();
    } else {
      print('vvvvvvvvvv');
    }
  }
}
