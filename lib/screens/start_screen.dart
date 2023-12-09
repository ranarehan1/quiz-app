import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  final void Function() switchScreen;
  const StartScreen(this.switchScreen,{super.key});

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            color:  const Color(0xffB0EDF1).withOpacity(0.6),
            width: 300,
          ),
          const SizedBox(height: 80),
            Text(
            "Learn Flutter the fun way!",
            style: GoogleFonts.montserrat(
              fontSize: 22,
              color: const Color(0xffB0EDF1),
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          OutlinedButton.icon(
            onPressed: switchScreen,
            style: OutlinedButton.styleFrom(
              foregroundColor:const  Color(0xffB0EDF1),
              side: const BorderSide(
                color: Color(0xffB0EDF1),
                width: 2
              ),
            ),
            icon: const Icon(Icons.arrow_forward_ios_sharp,size: 17),
            label:  const Text(
              "Start Quiz",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
