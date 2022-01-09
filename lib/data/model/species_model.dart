class Species {
  String? name;

  Species({this.name});

  Species.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
}
