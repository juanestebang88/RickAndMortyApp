import 'package:rick_morty/domain/entities/character.dart';
import 'package:rick_morty/domain/datasources/local_storage_datasource.dart';
import 'package:rick_morty/domain/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {

  final LocalStorageDatasource datasource;

  LocalStorageRepositoryImpl({required this.datasource});
  
  @override
  Future<bool> isCharacterFavorite(int characterId) {
    return datasource.isCharacterFavorite(characterId);
  }

  @override
  Future<List<CharacterEntity>> loadCharactersFavorites({int limit = 10, offset = 0}) {
    return datasource.loadCharactersFavorites(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleFavorite(CharacterEntity characterEntity) {
    return datasource.toggleFavorite(characterEntity);
  }
  
}