import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  MyTextField({required this.hint,required this.obscureText , required this.inputType, required this.takeValue});

  final String hint;
  final bool obscureText;
  final TextInputType inputType;
  final Function takeValue;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      keyboardType: inputType,
      textAlign: TextAlign.center,
      onChanged: (value){
        takeValue(value);
      },
      decoration: InputDecoration(
          hintText: hint,
          contentPadding: EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange,width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue,width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))
          )
      ),
    )
    ;
  }
}
