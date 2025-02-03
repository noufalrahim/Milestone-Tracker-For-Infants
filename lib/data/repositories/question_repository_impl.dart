import 'package:flutter/material.dart';
import 'package:milestone_tracker_for_infants/core/error/exceptions.dart';
import 'package:milestone_tracker_for_infants/core/network/api_client.dart';
import 'package:milestone_tracker_for_infants/data/models/question_model.dart';
import 'package:milestone_tracker_for_infants/domain/entities/question.dart';
import 'package:milestone_tracker_for_infants/domain/repositories/question_repository.dart';

class QuestionRepositoryImpl extends QuestionRepository {
  final ApiClient apiClient;

  QuestionRepositoryImpl(this.apiClient);

  @override
  Future<List<Question>> getQuestions() async {
    try {
      final response = await apiClient.get('/questions');
      debugPrint('response $response');
      final data = response as Map<String, dynamic>;

      return data['english'].keys.map<Question>((category){
        return QuestionModel(
          category: category, 
          questions: List<String>.from(data['english'][category]),
        );
      }).toList();
    }
    on Exception {
      throw ServerException();
    }
  }
}