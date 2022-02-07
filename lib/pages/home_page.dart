import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joke_app/bloc/jokeCubit/joke_cubit.dart';
import 'package:joke_app/bloc/jokeCubit/joke_states.dart';
import 'package:joke_app/constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    var provider = BlocProvider.of<JokeCubit>(context);

    provider.jokeData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = BlocProvider.of<JokeCubit>(context);

    return Scaffold(
      backgroundColor: Constants.kScaffoldColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: BlocBuilder<JokeCubit, JokeState>(
          builder: (context, state) {
            var data = state.jokeModel;
            var showAnswer = state.showAnswer;
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data.setup ?? '',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  !showAnswer
                      ? TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.red,
                              padding: const EdgeInsets.all(20)),
                          onPressed: () {
                            provider.showAnswer();
                          },
                          child: const Text(
                            "Answer",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ))
                      : Text(
                          data.delivery ?? '',
                          style: const TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        )
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          provider.jokeData();
        },
        child: const Icon(
          Icons.shuffle,
          color: Colors.white,
        ),
      ),
    );
  }
}
