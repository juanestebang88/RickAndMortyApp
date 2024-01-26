import 'package:dio/dio.dart';
import 'package:rick_morty/config/constants/api_constants.dart';

import 'package:rick_morty/domain/datasources/characters_datasource.dart';
import 'package:rick_morty/domain/entities/character.dart';

class RickAndMortyDatasource extends CharactersDatasource {
  
  final dio = Dio(BaseOptions(
    baseUrl: Constants.baseURL
  ));

  @override
  Future<List<Character>> getAllCharacters({int page = 1}) async{

    final response = await dio.get(Constants.characterEndpoint);
    final List<Character> characters = [];
    return characters;
  }
  
}