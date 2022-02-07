import 'package:joke_app/model/jokes_model.dart';

class JokeState {
  JokeModel jokeModel;
  bool showAnswer;

  JokeState({required this.jokeModel, required this.showAnswer});

  JokeState copyWith({
    JokeModel? jokeModel,
    bool? showAnswer,
  }) {
    return JokeState(
        jokeModel: jokeModel ?? this.jokeModel,
        showAnswer: showAnswer ?? this.showAnswer);
  }
}
