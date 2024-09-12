import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String tittle;
  final VoidCallback  onPress;
   RoundButton({super.key,required this.tittle,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return  Material(
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,
      child: MaterialButton(onPressed:onPress,
      child: Text(tittle),
      color: Colors.deepOrange,
      height: 50,
      minWidth: double.infinity,
      ),
    );
  }
}