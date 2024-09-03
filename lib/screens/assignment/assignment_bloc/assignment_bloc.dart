import 'dart:convert';
import 'dart:developer';
import 'package:TheStafferEmployee/constants/AppformateModel.dart';
import 'package:TheStafferEmployee/screens/assignment/Model/assignment_model/assignmentDetailApiModel.dart';
import 'package:TheStafferEmployee/screens/assignment/Model/assignmentNetworkCall.dart/assignment_Network_call.dart';
import 'package:TheStafferEmployee/screens/assignment/Model/assignment_model/assignmentapiModel.dart';
import 'package:TheStafferEmployee/screens/assignment/assignment_bloc/assignment_event.dart';
import 'package:TheStafferEmployee/screens/assignment/assignment_bloc/assignment_state.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AssignmentBloc extends Bloc<AssignmentEvent, AssignmentState> {
  AssignmentBloc() : super(AssignmentInitialState()) {
    on<AssignmentEvent>((assignmentState));
  }
  Future<void> assignmentState(
      AssignmentEvent event, Emitter<AssignmentState> emit) async {
    if (event is GetAssignmentDataEvent) {
      emit(AssignmentLoadingState());
      try {
        SharedPreferences p = await SharedPreferences.getInstance();
        var token = await p.getString('token') ?? '';
        log(token, name: 'token');

        var assignmentresponse =
            await AssignmentNetworkCalls.assignmentData(token);
        log(assignmentresponse.body.toString(), name: 'assignment response');

        if (assignmentresponse.statusCode == 200) {
          print('assignment status is 200');
          var assignmentBody = jsonDecode(assignmentresponse.body);

          if (assignmentBody != null) {
            AssignmentModel assignmentModel =
                AssignmentModel.fromJson(assignmentBody);

            if (assignmentModel.data.isEmpty) {
              emit(AssignmentErrorState(message: 'No assignments found.'));
              return;
            }

            int jobId = assignmentModel.data.first.jobId ?? 0;

            var responseformate = await AssignmentNetworkCalls.formate(token);
            if (responseformate.statusCode == 200) {
              print('formate status is 200');
              var formatBody = jsonDecode(responseformate.body);
              if (formatBody != null) {
                var responseDetail =
                    await AssignmentNetworkCalls.assignDetail(token, jobId);

                if (responseDetail.statusCode == 200) {
                  var assignmentdetailsBody = jsonDecode(responseDetail.body);
                  if (assignmentdetailsBody != null) {
                    FormatModel formateModel = FormatModel.fromJson(formatBody);
                    AssignmentDetailModel detailModel =
                        AssignmentDetailModel.fromJson(assignmentdetailsBody);
                    emit(AssignmentLoadedState(
                        assignmentResponse: assignmentModel,
                        formateResponse: formateModel,
                        detailResponse: detailModel));
                  } else {
                    emit(const AssignmentErrorState(
                        message: 'Assignment detail body is null'));
                  }
                } else {
                  emit(AssignmentErrorState(
                      message:
                          'Response detail status code is ${responseDetail.statusCode}'));
                }
              } else {
                emit(AssignmentErrorState(
                    message:
                        'format body data is null' + formatBody.toString()));
              }
            } else {
              emit(AssignmentErrorState(
                  message:
                      'Response format status code is ${responseformate.statusCode}'));
            }
          } else {
            emit(AssignmentErrorState(
                message:
                    'assignment body is null' + assignmentBody.toString()));
          }
        } else {
          emit(AssignmentErrorState(
              message:
                  'Assignment response status code is ${assignmentresponse.statusCode}'));
        }
      } catch (e) {
        emit(AssignmentErrorState(message: e.toString()));
      }
    }
  }
}
