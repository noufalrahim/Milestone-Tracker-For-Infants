import 'package:milestone_tracker_for_infants/domain/entities/question.dart';

class QuestionModel extends Question {
  const QuestionModel ({
    required super.category,
    required super.questions,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      category: json['category'], 
      questions: List<String>.from(json['questions']),
    );
  }

}