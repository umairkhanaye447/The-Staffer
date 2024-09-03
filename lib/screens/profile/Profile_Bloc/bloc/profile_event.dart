part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();


}
class GetUserProfileDataEvent extends ProfileEvent{
 
    @override
  List<Object> get props => [];
}

class LogoutButtonPressEvent extends ProfileEvent{
  LogoutButtonPressEvent();
    @override
  List<Object> get props => [];
}