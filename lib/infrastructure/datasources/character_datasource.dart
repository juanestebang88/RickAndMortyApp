import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:rick_morty/config/constants/constants.dart';

import 'package:rick_morty/domain/datasources/characters_datasource.dart';
import 'package:rick_morty/infrastructure/mappers/character_mapper.dart';
import 'package:rick_morty/infrastructure/models/character_model.dart';
import 'package:rick_morty/infrastructure/models/character_response.dart';
import 'package:rick_morty/domain/entities/character.dart';

class CharacterDatasource extends CharactersDatasource {
  int totalPages = 1;
  final dio = Dio(BaseOptions(
    baseUrl: Constants.baseURL
  ));

  @override
  Future<List<CharacterEntity>> getAllCharacters({int page = 1}) async{
    try {
      if (page>totalPages) return [];

      final response = await dio.get(Constants.characterEndpoint,
        queryParameters: { 'page': page }
      );

      final rickmartyApiResponse = CharacterResponse.fromJson(response.data);
      
      final List<CharacterEntity> characters = rickmartyApiResponse.results.map(
        (e) => CharacterMapper.characterToEntity(e)
        ).toList();

      totalPages = rickmartyApiResponse.info.pages;

      return characters;
      
    } catch (e) {
      log('!!******!!  Error en getAllCharacters: $e');
      return [];
    }
  }

  @override
  Future<CharacterEntity> getCharacter({String characterId = '1'}) async{
    try {
      final response = await dio.get('${Constants.characterEndpoint}$characterId');
      final rickmartyApiResponse = CharacterModel.fromJson(response.data);
      
      final CharacterEntity character = CharacterMapper.characterToEntity(rickmartyApiResponse);
      return character;
    } catch (e) {
      throw Exception ('Movie with id: $characterId not found');
    }
  }
}