part of 'punch_in_out_bloc.dart';

abstract class AttendanceEvent extends Equatable {
  const AttendanceEvent();

  @override
  List<Object> get props => [];
}

class SendCheckInEvent extends AttendanceEvent {
  final String checkInTime;
  final int employeeId;

  SendCheckInEvent({required this.checkInTime, required this.employeeId});

  @override
  List<Object> get props => [checkInTime, employeeId];
}

class SendCheckOutEvent extends AttendanceEvent {
  final String checkOutTime;
  final int employeeId;

  SendCheckOutEvent({required this.checkOutTime, required this.employeeId});

  @override
  List<Object> get props => [checkOutTime, employeeId];
}

class SendBreakStartEvent extends AttendanceEvent {
  final String breakStartTime;
  final int employeeId;

  SendBreakStartEvent({required this.breakStartTime, required this.employeeId});

  @override
  List<Object> get props => [breakStartTime, employeeId];
}

class SendBreakEndEvent extends AttendanceEvent {
  final String breakEndTime;
  final int employeeId;

  SendBreakEndEvent({required this.breakEndTime, required this.employeeId});

  @override
  List<Object> get props => [breakEndTime, employeeId];
}
