part of 'change_password_bloc.dart';

sealed class ChangePasswordState extends Equatable {
  const ChangePasswordState();
}

final class ChangePassInitialState extends ChangePasswordState {
  const ChangePassInitialState();
  @override
  List<Object> get props => [];
}

final class ChangePassLoadingState extends ChangePasswordState {
  const ChangePassLoadingState();
  @override
  List<Object> get props => [];
}

final class ChangePassLoadedState extends ChangePasswordState {
  const ChangePassLoadedState();
  @override
  List<Object> get props => [];
}

final class ChangePassErrorState extends ChangePasswordState {
  final String error;
  const ChangePassErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
