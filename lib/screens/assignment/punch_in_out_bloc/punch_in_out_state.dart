part of 'punch_in_out_bloc.dart';

abstract class AttendanceState extends Equatable {
  const AttendanceState();

  @override
  List<Object> get props => [];
}

class AttendanceInitial extends AttendanceState {}

class AttendanceLoading extends AttendanceState {}

class AttendanceSuccess extends AttendanceState {
  final String successMessage;

  AttendanceSuccess({required this.successMessage});

  @override
  List<Object> get props => [successMessage];
}

class AttendanceFailure extends AttendanceState {
  final String error;

  AttendanceFailure({required this.error});

  @override
  List<Object> get props => [error];
}
