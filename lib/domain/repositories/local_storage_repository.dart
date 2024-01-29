import 'package:rick_morty/domain/entities/character.dart';

abstract class LocalStorageRepository {

  Future<void> toggleFavorite( CharacterEntity characterEntity );

  Future<bool> isCharacterFavorite(int characterId);

  Future<List<CharacterEntity>> loadCharactersFavorites({int limit = 10, offset = 0});

}