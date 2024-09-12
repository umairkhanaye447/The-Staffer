import 'package:blog_app/Widgets/ReUseableButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterationScreen extends StatefulWidget {
  const RegisterationScreen({super.key});

  @override
  State<RegisterationScreen> createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  FirebaseAuth auth= FirebaseAuth.instance;
  final formkey= GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool showspinner= false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showspinner,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                key: formkey,
                controller: emailcontroller,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    labelText: "Email",
                    prefix: Icon(Icons.email),
                    border: OutlineInputBorder(),
                    hintText: "Email"),
                onChanged: (value) {
                  email = value;
                },
                validator: (value) {
                  return value!.isEmpty ? "enter email" : null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                key: formkey,
                obscureText: true,
                controller: passcontroller,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "password",
                    prefix: Icon(Icons.lock),
                    hintText: "Password"),
                onChanged: (value) {
                  password = value;
                },
                validator: (value) {
                  return value!.isEmpty ? "enter Password" : null;
                },
              ),
            ),
            RoundButton(tittle: "Register", 
            onPress: () async{
              setState(() {
                showspinner=true;
              });
              if(formkey.currentContext!.responsiveValue(mobile: true)){
                try{
                  final user = await auth.createUserWithEmailAndPassword(email: email.toString(), password: password.toString());
                  if(user != null){
                    print("success");
                    toastMssage("Account sucessfully created");
                    setState(() {
                showspinner=false;
              });
                  }
                }catch(e){
                  print(e.toString());
                  toastMssage(e.toString());
                      setState(() {
                showspinner=false;
              }); 
                }
              };
            })
          ],
        ),
      ),
    );
  }
}
void toastMssage(String message){

Fluttertoast.showToast(
        msg: message.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
}