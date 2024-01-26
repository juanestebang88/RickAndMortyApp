import 'package:rick_morty/domain/entities/character.dart';

abstract class CharacterRepository {
  Future<List<Character>> getAllCharacters({ int page = 1});
}