import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joke_app/bloc/jokeCubit/joke_states.dart';
import 'package:joke_app/model/jokes_model.dart';
import 'package:joke_app/service/joke_service.dart';

class JokeCubit extends Cubit<JokeState> {
  JokeCubit() : super(JokeState(jokeModel: JokeModel(), showAnswer: false));

  JokeService jokeService = JokeService();

  Future<void> jokeData() async {
    var jokeModel = await jokeService.getJokeData();
    emit(state.copyWith(jokeModel: jokeModel, showAnswer: false));
  }

  showAnswer() {
    emit(state.copyWith(showAnswer: true));
  }
}
