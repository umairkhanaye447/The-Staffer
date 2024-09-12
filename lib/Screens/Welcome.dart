import 'package:blog_app/Screens/Register.dart';
import 'package:blog_app/Widgets/ReUseableButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class WelcomScreen extends StatefulWidget {
  const WelcomScreen({super.key});

  @override
  State<WelcomScreen> createState() => _WelcomScreenState();
}

class _WelcomScreenState extends State<WelcomScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Colors.blueGrey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center ,
          children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: RoundButton(tittle: "Register", onPress: (){
              Get.to(RegisterationScreen());
            }),
          ),
             Padding(
               padding: const EdgeInsets.all(15),
               child: RoundButton(tittle: "LogIn", onPress: (){
                           ;
                         }),
             )
        ],),
      ),
    );
  }
}