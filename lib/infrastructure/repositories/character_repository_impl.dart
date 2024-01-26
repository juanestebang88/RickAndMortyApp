import 'package:rick_morty/domain/datasources/characters_datasource.dart';
import 'package:rick_morty/domain/entities/character.dart';
import 'package:rick_morty/domain/repositories/characters_repository.dart';

class CharactersRepositoryImpl extends CharactersRepository {

  final CharactersDatasource datasource;

  CharactersRepositoryImpl(this.datasource);

  @override
  Future<List<CharacterEntity>> getAllCharacters({int page = 1}) {
    return datasource.getAllCharacters(page: page);
  }
  
}