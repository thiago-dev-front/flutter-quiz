import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
             final isCorrect = data['user_answer'] == data['correct_answer'];
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration:  BoxDecoration(
                    color: isCorrect ? Colors.blue : const Color.fromARGB(255, 208, 60, 2), 
                    shape: BoxShape.circle, // Forma circular
                  ),
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                      right: 20), // Espaçamento entre o círculo e o texto
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: const TextStyle(
                      // Cor do texto dentro do círculo
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        data['question'] as String,
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data['user_answer'] as String,
                        style: GoogleFonts.lato(
                            color: isCorrect ? Colors.blue : const Color.fromARGB(255, 208, 60, 2),
                            fontSize: 18),
                      ),
                      Text(
                        data['correct_answer'] as String,
                        style: GoogleFonts.roboto(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
