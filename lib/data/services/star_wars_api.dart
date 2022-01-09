import 'package:dio/dio.dart';
import 'package:starwars/data/model/people_model.dart';
import 'package:starwars/data/model/planet_model.dart';
import 'package:starwars/data/model/species_model.dart';
import 'package:starwars/data/model/vehicles_model.dart';

class StarWarsApi {
  final _dio = Dio();

  //Trer los personajes por página
  Future<StarWarModel?> getPeople({int page = 1}) async {
    String _url = "https://swapi.dev/api/people/?page=$page";

    try {
      Response response = await _dio.get(_url);
      StarWarModel starWarModel = StarWarModel.fromJson(response.data);

      if (starWarModel.results != null) {
        for (var people in starWarModel.results!) {
          if (people.species!.isEmpty) {
            people.specieName = 'Human';
            try {
              Response responsePlanet = await _dio.get(people.homeworld ?? '');
              people.planetName = Planet.fromJson(responsePlanet.data).name;
            } on DioError catch (e) {
              print('***********');
              print(e.toString());
              print('***********');
            }
          } else {
            try {
              Response responsePlanet = await _dio.get(people.homeworld!);
              people.planetName = Planet.fromJson(responsePlanet.data).name;

              Response responseSpecie = await _dio.get(people.species![0]);
              people.specieName = Species.fromJson(responseSpecie.data).name;
            } on DioError catch (e) {
              print('***********');
              print(e.toString());
              print('***********');
            }
          }

          if (people.vehicles!.isNotEmpty) {
            try {
              for (String vehicles in people.vehicles ?? []) {
                Response vehicleTemp = await _dio.get(vehicles);
                people.vehiclesName!
                    .add(Vehicles.fromJson(vehicleTemp.data).name!);
              }
            } on DioError catch (e) {
              print('***********');
              print(e.toString());
              print('***********');
            }
          }
        }
      }

      return starWarModel;
    } on DioError catch (e) {
      print('***************');
      print(e.toString());
      print('***************');
    }
  }
}
