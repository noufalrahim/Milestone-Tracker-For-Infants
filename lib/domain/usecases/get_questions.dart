import 'package:milestone_tracker_for_infants/domain/entities/question.dart';
import 'package:milestone_tracker_for_infants/domain/repositories/question_repository.dart';

class GetQuestions {
  final QuestionRepository repository;

  GetQuestions(this.repository);

  Future<List<Question>> call() async {
    return await repository.getQuestions();
  }
}