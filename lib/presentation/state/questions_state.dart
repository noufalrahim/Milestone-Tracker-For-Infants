import 'package:flutter/material.dart';
import 'package:milestone_tracker_for_infants/core/network/api_client.dart';
import 'package:milestone_tracker_for_infants/data/repositories/question_repository_impl.dart';
import 'package:milestone_tracker_for_infants/domain/entities/question.dart';
import 'package:milestone_tracker_for_infants/domain/usecases/get_questions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class QuestionsState extends StateNotifier<AsyncValue<List<Question>>> {
  final GetQuestions getQuestions;

  QuestionsState(this.getQuestions) : super(const AsyncValue.loading());

  Future<void> fetchQuestions() async {
    try {
      final question = await getQuestions();
      debugPrint("Questions!!: $question");
    }
    catch (e) {
      state = AsyncValue.error('Failed to load questions', StackTrace.current);
    }
  }
}

final questionsProvider =
    StateNotifierProvider<QuestionsState, AsyncValue<List<Question>>>((ref) {
  final getQuestions = ref.watch(getQuestionsProvider);
  return QuestionsState(getQuestions);
});

final getQuestionsProvider = Provider<GetQuestions>((ref) {
  final repository = ref.watch(questionRepositoryProvider);
  return GetQuestions(repository);
});

final questionRepositoryProvider = Provider<QuestionRepositoryImpl>((ref) {
  final apiClient = ApiClient('http://localhost:3000');
  return QuestionRepositoryImpl(apiClient);
});