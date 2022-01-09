class Vehicles {
  String? name;

  Vehicles({this.name});

  Vehicles.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
}
