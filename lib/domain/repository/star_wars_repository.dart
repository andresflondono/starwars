import 'package:starwars/data/model/people_model.dart';
import 'package:starwars/data/services/star_wars_api.dart';

abstract class StarWarsRepository {
  //Trer los personajes por página
  Future<StarWarModel?> getPeople({int page = 1});
}

class StarWarsImplementation implements StarWarsRepository {
  final StarWarsApi _api;

  StarWarsImplementation(this._api);

  @override
  Future<StarWarModel?> getPeople({int page = 1}) {
    return _api.getPeople(page: page);
  }
}
