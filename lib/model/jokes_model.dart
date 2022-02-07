class JokeModel {
  String? setup;
  String? delivery;

  JokeModel({this.delivery, this.setup});

  JokeModel.fromJson(Map<String, dynamic> json) {
    setup = json['setup'];
    delivery = json['delivery'];
  }
}
