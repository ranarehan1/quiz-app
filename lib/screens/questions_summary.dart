import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summary});

  final List<Map<String, Object>> summary;

  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map((data) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 33,
                    width: 33,
                    decoration: BoxDecoration(
                      color: data['user_answers'] == data['correct_answers']
                          ? const Color(0xff86ced3)
                          : const Color(0xffbe9788),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff183842),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          data["question"] as String,
                          style: GoogleFonts.montserrat(
                              color: Colors.white, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data["correct_answers"] as String,
                          style: const TextStyle(
                              color: Color(0xff86ced3), fontSize: 12.5),
                        ),
                        Text(
                          data["user_answers"] as String,
                          style: TextStyle(
                              color: data["user_answers"] ==
                                      data["correct_answers"]
                                  ? const Color(0xff86ced3)
                                  : const Color(0xffbe9788),
                              fontSize: 12.5),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
