import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
  const AnswerButton({required this.answerText, required this.pressed,super.key});
  final String answerText;
  final void Function() pressed;
  @override
  Widget build(context){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ElevatedButton(
        onPressed: pressed,
        style: ElevatedButton.styleFrom(

          backgroundColor: const Color(0xff1d4350),
          foregroundColor: const Color(0xffB0EDF1),
          elevation:3,

        ),
        child: Text(textAlign: TextAlign.center,answerText),
      ),
    );
  }
}