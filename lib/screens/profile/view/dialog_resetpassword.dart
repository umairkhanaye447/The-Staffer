import 'dart:ffi';
import 'package:TheStafferEmployee/screens/profile/Profile_Bloc/bloc/bloc/change_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  Color _c = Colors.redAccent;
  bool _showPassword = true;
  bool _changePassword = true;
  bool _confirmPassword = true;
  final currentpasswordController = TextEditingController();
  final newpasswordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  void _changePasswordVisibility() {
    setState(() {
      _changePassword = !_changePassword;
    });
  }

  void _conmfirmPasswordVisibility() {
    setState(() {
      _confirmPassword = !_confirmPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 120,
          ),
          AlertDialog(content: Container(), actions: <Widget>[
            Column(children: [
              Padding(
                padding: const EdgeInsets.all(14),
                child: TextFormField(
                  controller: currentpasswordController,
                  obscureText: _showPassword,
                  style: const TextStyle(
                      fontSize: 14.0, color: Color.fromRGBO(83, 83, 83, 1)
                      // fontWeight: FontWeight.bold
                      ),
                  cursorColor: Colors.grey.shade500,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: _togglePasswordVisibility,
                      child: _showPassword
                          ? const Icon(Icons.visibility,
                              color: Color.fromRGBO(183, 14, 105, 1))
                          : const Icon(Icons.visibility_off,
                              color: Color.fromRGBO(183, 14, 105, 1)),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(5.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(5.0)),
                    contentPadding:
                        const EdgeInsets.only(left: 10.0, right: 10.0),
                    labelText: "Current Password",
                    hintStyle: const TextStyle(
                        fontSize: 12.0,
                        color: Color.fromRGBO(83, 83, 83, 1),
                        fontWeight: FontWeight.w500),
                    labelStyle: const TextStyle(
                        fontSize: 12.0,
                        color: Color.fromRGBO(83, 83, 83, 1),
                        fontWeight: FontWeight.w500),
                  ),
                  autocorrect: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: TextFormField(
                  obscureText: _changePassword,
                  controller: newpasswordController,
                  style: const TextStyle(
                      fontSize: 14.0, color: Color.fromRGBO(83, 83, 83, 1)
                      // fontWeight: FontWeight.bold
                      ),
                  cursorColor: Colors.grey.shade500,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: _changePasswordVisibility,
                      child: _changePassword
                          ? const Icon(Icons.visibility,
                              color: Color.fromRGBO(183, 14, 105, 1))
                          : const Icon(Icons.visibility_off,
                              color: Color.fromRGBO(183, 14, 105, 1)),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(5.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(5.0)),
                    contentPadding:
                        const EdgeInsets.only(left: 10.0, right: 10.0),
                    labelText: "New Password",
                    hintStyle: const TextStyle(
                        fontSize: 12.0,
                        color: Color.fromRGBO(83, 83, 83, 1),
                        fontWeight: FontWeight.w500),
                    labelStyle: const TextStyle(
                        fontSize: 12.0,
                        color: Color.fromRGBO(83, 83, 83, 1),
                        fontWeight: FontWeight.w500),
                  ),
                  autocorrect: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: TextFormField(
                  obscureText: _confirmPassword,
                  controller: confirmpasswordController,
                  style: const TextStyle(
                      fontSize: 14.0, color: Color.fromRGBO(83, 83, 83, 1)),
                  cursorColor: Colors.grey.shade500,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: _conmfirmPasswordVisibility,
                      child: _confirmPassword
                          ? const Icon(Icons.visibility,
                              color: Color.fromRGBO(183, 14, 105, 1))
                          : const Icon(Icons.visibility_off,
                              color: Color.fromRGBO(183, 14, 105, 1)),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(5.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(5.0)),
                    contentPadding:
                        const EdgeInsets.only(left: 10.0, right: 10.0),
                    labelText: "Confirm Password",
                    hintStyle: const TextStyle(
                        fontSize: 12.0,
                        color: Color.fromRGBO(83, 83, 83, 1),
                        fontWeight: FontWeight.w500),
                    labelStyle: const TextStyle(
                        fontSize: 12.0,
                        color: Color.fromRGBO(83, 83, 83, 1),
                        fontWeight: FontWeight.w500),
                  ),
                  autocorrect: false,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromRGBO(13, 91, 196, 1)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                //   side: BorderSide(color: Colors.red.shade900),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              //functionChangepassword();
                              Navigator.pop(context);
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Container(
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromRGBO(13, 91, 196, 1)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Save',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            context.read<ChangePasswordBloc>().add(
                                ChangePassEvent(
                                    password: currentpasswordController.text,
                                    newpassword: newpasswordController.text,
                                    confirmpassword:
                                        confirmpasswordController.text));
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ]),
          ]),
        ],
      ),
    );
  }
}
