import 'package:TheStafferEmployee/screens/assignment/Model/AttendanceNetwork_Calls/AttendanceNetworkcall.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'punch_in_out_event.dart';
part 'punch_in_out_state.dart';
// part 'check_in_chck_out_event.dart';
// part 'check_in_chck_out_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  AttendanceBloc() : super(AttendanceInitial()) {
    on<SendCheckInEvent>(_onSendCheckInEvent);
    on<SendCheckOutEvent>(_onSendCheckOutEvent);
    on<SendBreakStartEvent>(_onSendBreakStartEvent);
    on<SendBreakEndEvent>(_onSendBreakEndEvent);
  }

  Future<void> _onSendCheckInEvent(
    SendCheckInEvent event,
    Emitter<AttendanceState> emit,
  ) async {
    await _sendAttendanceData(
      body: {
        'key': 'check_in',
        'time': event.checkInTime,
        'employee_id': event.employeeId.toString(),
      },
      emit: emit,
    );
  }

  Future<void> _onSendCheckOutEvent(
    SendCheckOutEvent event,
    Emitter<AttendanceState> emit,
  ) async {
    await _sendAttendanceData(
      body: {
        'key': 'check_out',
        'time': event.checkOutTime,
        'employee_id': event.employeeId.toString(),
      },
      emit: emit,
    );
  }

  Future<void> _onSendBreakStartEvent(
    SendBreakStartEvent event,
    Emitter<AttendanceState> emit,
  ) async {
    await _sendAttendanceData(
      body: {
        'key': 'break_start',
        'time': event.breakStartTime,
        'employee_id': event.employeeId.toString(),
      },
      emit: emit,
    );
  }

  Future<void> _onSendBreakEndEvent(
    SendBreakEndEvent event,
    Emitter<AttendanceState> emit,
  ) async {
    await _sendAttendanceData(
      body: {
        'key': 'break_end',
        'time': event.breakEndTime,
        'employee_id': event.employeeId.toString(),
      },
      emit: emit,
    );
  }

  Future<void> _sendAttendanceData({
    required Map<String, String> body,
    required Emitter<AttendanceState> emit,
  }) async {
    emit(AttendanceLoading());
    try {
      SharedPreferences p = await SharedPreferences.getInstance();
      var token = await p.getString('token') ?? '';

      final response =
          await AttendanceNetworkCall.sendAttendanceData(token, body);
      if (response.containsKey('success')) {
        emit(AttendanceSuccess(successMessage: response['success']));
      } else {
        emit(AttendanceFailure(
            error: response['error'] ?? 'Failed to send data.'));
      }
    } catch (e) {
      emit(AttendanceFailure(error: e.toString()));
    }
  }
}
