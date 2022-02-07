import 'dart:convert';
import 'dart:developer';

import 'package:joke_app/constants/constants.dart';
import 'package:joke_app/model/jokes_model.dart';
import 'package:http/http.dart' as http;

class JokeService {
  Future<JokeModel> getJokeData() async {
    dynamic jokedata;

    try {
      var headers = {
        'x-rapidapi-host': Constants.apiHost,
        'x-rapidapi-key': Constants.apiKey
      };

      var response = await http.Client().get(
          Uri.parse(
              "https://jokeapi-v2.p.rapidapi.com/joke/Programming?type=twopart"),
          headers: headers);

      var jsonResponse = json.decode(response.body);

      jokedata = JokeModel.fromJson(jsonResponse);
    } catch (error) {
      log(error.toString());
    }

    return jokedata;
  }
}
