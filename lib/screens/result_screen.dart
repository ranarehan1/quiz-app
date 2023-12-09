import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/screens/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswers, required this.restart});

  final List<String> chosenAnswers;
  final void Function() restart;

  List<Map<String, Object>> getSummary() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          "question_index": i,
          "question": questions[i].question,
          "correct_answers": questions[i].answers[0],
          "user_answers": chosenAnswers[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummary();
    final totalAnswers = questions.length;
    final correctAnswers = summaryData.where((data) {
      return data["user_answers"] == data["correct_answers"];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $correctAnswers out of $totalAnswers questions correctly!",
              style: GoogleFonts.montserrat(
                fontSize: 20,
                color: const Color(0xffB0EDF1),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summary: summaryData),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              onPressed: restart,
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xffB0EDF1),
                side: const BorderSide(color: Color(0xffB0EDF1), width: 2),
              ),
              icon: const Icon(Icons.restart_alt_rounded, size: 21),
              label:  Text(
                "Restart Quiz",
                style: GoogleFonts.montserrat(
                  fontSize: 17,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
