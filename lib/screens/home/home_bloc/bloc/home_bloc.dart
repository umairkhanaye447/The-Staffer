import 'dart:convert';
import 'package:TheStafferEmployee/constants/AppformateModel.dart';
import 'package:TheStafferEmployee/screens/Login/view/login_form.dart';
import 'package:TheStafferEmployee/screens/home/Model/Network_calls/Home_Network_Calls.dart';
import 'package:TheStafferEmployee/screens/home/Model/home_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeEvent>(homestate);
     on<LogoutButtonPressedEvent>(logoutstate);
  }

  BuildContext? get context => null;

  Future<void> homestate(HomeEvent event, Emitter<HomeState> emit) async {
    if (event is GetUserHomeDataEvent) {
      emit(HomeDataLoadingState());
      print('HomeLoading');
      try {
        SharedPreferences p = await SharedPreferences.getInstance();
        var token = await p.getString('token') ?? "";

        var homeResponse = await HomeNetworkCalls.homeData(token);
        if (homeResponse.statusCode == 200) {
          print('home data status is 200');
          var homeBody = jsonDecode(homeResponse.body);
          if (homeBody['data'] != null) {
            var formatResponse = await HomeNetworkCalls.formate(token);
            if (formatResponse.statusCode == 200) {
              print('formate status is 200');
              var formatBody = jsonDecode(formatResponse.body);
              if (formatBody != null) {
                HomeModel homeModel = HomeModel.fromJson(homeBody);
                FormatModel formateModel = FormatModel.fromJson(formatBody);
                emit(HomeDataCompletedstate(
                    homeResponse: homeModel, formateResponse: formateModel));
              } else {
                emit(HomeDataErrorState(message: 'Error'));
              }
            } else {
              emit(HomeDataErrorState(
                  message:
                      'Format response status is ${formatResponse.statusCode}'));
            }
          } else {
            emit(HomeDataErrorState(
                message: 'Home body data is null: ' + homeBody.toString()));
          }
        } else {
          emit(HomeDataErrorState(
              message:
                  'Home response status code is ${homeResponse.statusCode}'));
        }
      } catch (e) {
        emit(HomeDataErrorState(message: e.toString()));
      }
    } 
}
  Future<void> logoutstate(
      LogoutButtonPressedEvent event, Emitter<HomeState> emit) async {
      try {
        SharedPreferences p = await SharedPreferences.getInstance();
        await p.remove('token');
        emit(LogoutSuccessState());
      } catch (e) {
        emit(HomeDataErrorState(message: e.toString()));
      }
    }
    String getDateInGoogleFormate(String a) {
    return a;
  }
  }