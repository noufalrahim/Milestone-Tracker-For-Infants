import 'package:flutter/material.dart';

class QuestionCard extends StatefulWidget {
  final int index;
  final String category;
  final List<dynamic> questions;
  final bool isLoading;

  const QuestionCard(
      {super.key,
      required this.index,
      required this.category,
      required this.questions,
      required this.isLoading});

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Theme.of(context).primaryColor,
      ),
      child: Center(
        child: widget.isLoading
            ? const CircularProgressIndicator()
            : widget.questions.isNotEmpty
                ? Text(
                    widget.questions[widget.index]['malayalam'] ??
                        'No Question Available',
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  )
                : const Text(
                    'No questions available.',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
      ),
    );
  }
}
