class Planet {
  String? name;

  Planet({this.name});

  Planet.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
}
