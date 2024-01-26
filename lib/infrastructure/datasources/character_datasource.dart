import 'package:dio/dio.dart';

import 'package:rick_morty/config/constants/api_constants.dart';

import 'package:rick_morty/domain/datasources/characters_datasource.dart';
import 'package:rick_morty/infrastructure/mappers/character_mapper.dart';
import 'package:rick_morty/infrastructure/models/character_response.dart';
import 'package:rick_morty/domain/entities/character.dart';

class CharacterDatasource extends CharactersDatasource {
  
  final dio = Dio(BaseOptions(
    baseUrl: Constants.baseURL
  ));

  @override
  Future<List<CharacterEntity>> getAllCharacters({int page = 1}) async{

    final response = await dio.get(Constants.characterEndpoint);
    final rickmartyApiResponse = CharacterResponse.fromJson(response.data);
    
    final List<CharacterEntity> characters = rickmartyApiResponse.results.map(
      (e) => CharacterMapper.characterToEntity(e)
      ).toList();

    return characters;
  }
  
}