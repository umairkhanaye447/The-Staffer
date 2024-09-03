part of 'change_password_bloc.dart';

sealed class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();

}
  class ChangePassEvent extends ChangePasswordEvent{
  final String password;
  final String newpassword;
  final String confirmpassword;
  const ChangePassEvent({
    required this.password,required this.newpassword,required this.confirmpassword
    });
  @override
  List<Object> get props => [password,newpassword,confirmpassword];
}
