import 'package:milestone_tracker_for_infants/domain/entities/question.dart';

abstract class QuestionRepository {
  Future<List<Question>> getQuestions();
}