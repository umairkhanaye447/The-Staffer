import 'dart:convert';
import 'dart:developer';
import 'dart:math';
import 'package:TheStafferEmployee/constants/AppformateModel.dart';
import 'package:TheStafferEmployee/screens/timesheet/Model/timesheetApi.dart';
import 'package:TheStafferEmployee/screens/timesheet/Model/Network_calls/timesheet_network_call.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'time_sheet_event.dart';
part 'time_sheet_state.dart';

class TimeSheetBloc extends Bloc<TimeSheetEvent, TimeSheetState> {
  TimeSheetBloc() : super(TimeSheetLoadingState()) {
    on<TimeSheetEvent>(_gettimesheetdata);
  }

  Future<void> _gettimesheetdata(
      TimeSheetEvent event, Emitter<TimeSheetState> emit) async {
    if (event is GetTimeSheetDataEvent) {
      emit(TimeSheetLoadingState());
      try {
        SharedPreferences p = await SharedPreferences.getInstance();
        var token = await p.getString('token') ?? '';

        var timesheetresponse = await TimeSheetNetworkCall.timesheetData(
            token, event.startDate, event.endDate);
        print('timesheetresponse status code: ${timesheetresponse.statusCode}');
        print('timesheetresponse body: ${timesheetresponse.body}');

        if (timesheetresponse.statusCode == 200) {
          try {
            var timesheetBody = jsonDecode(timesheetresponse.body);
            print('Decoded timesheet JSON: $timesheetBody');

            if (timesheetBody != null) {
              TimeSheetModel timesheetModel =
                  TimeSheetModel.fromJson(timesheetBody);
              var formatresponse = await TimeSheetNetworkCall.formatData(token);

              print('formatresponse status code: ${formatresponse.statusCode}');
              print('formatresponse body: ${formatresponse.body}');

              if (formatresponse.statusCode == 200) {
                var formatBody = jsonDecode(formatresponse.body);

                if (formatBody != null) {
                  FormatModel formatModel = FormatModel.fromJson(formatBody);
                  emit(TimeSheetCompletedState(
                      timesheetResponse: timesheetModel,
                      formateResponse: formatModel));
                } else {
                  emit(
                      TimeSheetErrorState(message: 'Format body data is null'));
                }
              } else {
                emit(TimeSheetErrorState(
                    message:
                        'Status code of formatresponse is ${formatresponse.statusCode}'));
              }
            } else {
              emit(TimeSheetErrorState(message: 'Timesheet body data is null'));
            }
          } catch (e) {
            print('Error during JSON decoding or model creation: $e');
            emit(TimeSheetErrorState(
                message: 'Error decoding timesheet JSON: ${e.toString()}'));
          }
        } else {
          emit(TimeSheetErrorState(
              message:
                  'Status code of timesheetresponse is ${timesheetresponse.statusCode}'));
        }
      } catch (e) {
        print('Caught an exception: $e');
        emit(TimeSheetErrorState(message: e.toString()));
      }
    }
  }
}
