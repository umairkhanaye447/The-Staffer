import 'dart:convert';
import 'package:TheStafferEmployee/screens/profile/Model/Network_Call/profile_network_call.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc() : super(const ChangePassInitialState()) {
    on<ChangePasswordEvent>(changepass);
  }
  Future<void> changepass(
      ChangePasswordEvent event, Emitter<ChangePasswordState> emit) async {
    if (event is ChangePassEvent) {
      emit(const ChangePassLoadingState());
      try {
        SharedPreferences p = await SharedPreferences.getInstance();
        var token = await p.getString('token') ?? '';

        var changePasswordResponse = await ProfileNetworkCall.changePassword(
          token,
          currentpassword: event.password,
          newpassword: event.newpassword,
          confirmpassword: event.confirmpassword,
        );
        if (changePasswordResponse.statusCode == 200) {
          var changepasswordjson = jsonDecode(changePasswordResponse.body);
          if (changepasswordjson['token'] != null) {
            emit(const ChangePassLoadedState());
          } else {
            emit(ChangePassErrorState(
                error: 'changepasswordjson token is null$changepasswordjson'));
          }
        }
      } catch (e) {
        ChangePassErrorState(error: e.toString());
      }
    }
  }
}
