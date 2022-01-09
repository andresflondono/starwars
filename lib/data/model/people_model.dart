class StarWarModel {
  int? count;
  String? next;
  String? previous;
  List<Results>? results;

  StarWarModel({this.count, this.next, this.previous, this.results});

  @override
  String toString() {
    return """
      count : $count \n
      next : $next \n
      previous : $previous \n
      results : $results \n
    """;
  }

  StarWarModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }
}

class Results {
  String? name;
  String? specieName;
  String? planetName;
  String? height;
  String? mass;
  String? hairColor;
  String? skinColor;
  String? eyeColor;
  String? birthYear;
  String? gender;
  String? homeworld;
  List<String>? films;
  List<String>? species;
  List<String>? vehicles;
  List<String>? vehiclesName;
  List<String>? starships;
  String? created;
  String? edited;
  String? url;

  @override
  String toString() {
    return """vehicles: $vehiclesName""";
  }

  Results(
      {this.name,
      this.planetName,
      this.specieName,
      this.height,
      this.mass,
      this.hairColor,
      this.skinColor,
      this.eyeColor,
      this.birthYear,
      this.gender,
      this.homeworld,
      this.films,
      this.species,
      this.vehicles,
      this.starships,
      this.created,
      this.edited,
      this.url});

  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    specieName = null;
    planetName = null;
    height = json['height'];
    mass = json['mass'];
    hairColor = json['hair_color'];
    skinColor = json['skin_color'];
    eyeColor = json['eye_color'];
    birthYear = json['birth_year'];
    gender = json['gender'];
    homeworld = json['homeworld'];
    films = json['films'].cast<String>();
    species = json['species'].cast<String>();
    vehicles = json['vehicles'].cast<String>();
    vehiclesName = [];
    starships = json['starships'].cast<String>();
    created = json['created'];
    edited = json['edited'];
    url = json['url'];
  }
}
