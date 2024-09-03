import 'dart:ffi';
import 'package:TheStafferEmployee/screens/assignment/Model/assignmentNetworkCall.dart/assignment_Network_call.dart';
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

class UpcomingAssignment extends StatefulWidget {
  @override
  _UpcomingAssignmentState createState() => _UpcomingAssignmentState();
}

class _UpcomingAssignmentState extends State<UpcomingAssignment> {
  String valueExist = "";

  @override
  void initState() {
    super.initState();
    context.read<AssignmentBloc>().add(GetAssignmentDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AssignmentBloc, AssignmentState>(
        builder: (context, state) {
          if (state is AssignmentLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AssignmentErrorState) {
            return Center(
              child: Text('Failed to load assignments: ${state.message}'),
            );
          } else if (state is AssignmentLoadedState) {
            if (state.assignmentResponse.data.isEmpty) {
              return Center(
                child: const Text(
                  'No Upcoming Assignments',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Nunito Sans',
                      color: Color.fromRGBO(112, 112, 112, 1)),
                ),
              );
            }

            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.assignmentResponse.data.length,
                    itemBuilder: (context, index) {
                      if (state.assignmentResponse.data[index].empStatus ==
                          'Upcoming') {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Assignmentdetail(
                                    jobid: state
                                        .assignmentResponse.data[index].jobId,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                border: Border.all(
                                    color:
                                        const Color.fromRGBO(79, 171, 247, 1)),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 15),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          state.assignmentResponse.data[index]
                                                  .jobPosition ??
                                              ' ',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 19.0),
                                        ),
                                        Image.asset(
                                          "images/Path 58358@2x.png",
                                          height: 15,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      state.assignmentResponse.data[index]
                                              .customer ??
                                          ' ',
                                      style: const TextStyle(
                                          color:
                                              Color.fromRGBO(112, 112, 112, 1),
                                          fontSize: 10.0),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(18, 0, 20, 0),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.baseline,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            const Text(
                                              "Start Date ",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      112, 112, 112, 1),
                                                  fontSize: 10.0),
                                            ),
                                            SizedBox(height: 2),
                                            Text(
                                              state
                                                          .assignmentResponse
                                                          .data[index]
                                                          .startDate !=
                                                      null
                                                  ? DateFormat(state
                                                          .formateResponse
                                                          .data[0]
                                                          .currentDateFormat)
                                                      .format(state
                                                          .assignmentResponse
                                                          .data[index]
                                                          .startDate)
                                                  : ' - - - ',
                                              style: const TextStyle(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 1),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14.0),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 60),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.baseline,
                                            textBaseline:
                                                TextBaseline.alphabetic,
                                            children: [
                                              const Text(
                                                "End Date",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        112, 112, 112, 1),
                                                    fontSize: 10.0),
                                              ),
                                              SizedBox(height: 2),
                                              Text(
                                                DateFormat(state
                                                        .formateResponse
                                                        .data[0]
                                                        .currentDateFormat)
                                                    .format(DateTime.parse(state
                                                        .assignmentResponse
                                                        .data[index]
                                                        .endDate)),
                                                style: const TextStyle(
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 1),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.0),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        return SizedBox.shrink(); // Return an empty widget
                      }
                    },
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: const Text(
                'No Upcoming Assignments',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Nunito Sans',
                    color: Color.fromRGBO(112, 112, 112, 1)),
              ),
            );
          }
        },
      ),
    );
  }
}
