import 'package:rick_morty/domain/entities/character.dart';

abstract class CharactersRepository {
  Future<List<CharacterEntity>> getAllCharacters({ int page = 1});
}