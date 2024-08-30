import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({required this.color, required this.buttonText, required this.fun});

  final Color color;
  final String buttonText;
  final Function fun;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(10),
        child: MaterialButton(minWidth: 120,height: 42,onPressed: (){
          fun();
        },child: Text(buttonText,style: TextStyle(color: Colors.white),
        ),
        ),
      ),
    );
  }
}
