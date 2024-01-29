import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty/domain/entities/character.dart';
import 'package:rick_morty/domain/repositories/local_storage_repository.dart';
import 'package:rick_morty/presentation/providers/storage/local_storage_provider.dart';

final favoritesCharacterProvider = StateNotifierProvider<StorageCharactersNotifier, Map<int, CharacterEntity>>((ref){
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);
  return StorageCharactersNotifier(localStorageRepository: localStorageRepository);
});

class StorageCharactersNotifier extends StateNotifier<Map<int, CharacterEntity>> {
  int page = 0;
  final LocalStorageRepository localStorageRepository;

  StorageCharactersNotifier({required this.localStorageRepository}) : super({});
  
  Future<void> loadNextPage() async{
    final tempCharactersMap = <int, CharacterEntity>{};
    final charactersFavorites = await localStorageRepository
    .loadCharactersFavorites(offset: page * 10);

    page++;

    for (final character in charactersFavorites) {
      tempCharactersMap[character.id] = character;
    }

    state = { ...state, ...tempCharactersMap };
  }

  Future<void> toggleFavorite( CharacterEntity characterEntity) async{
    await localStorageRepository.toggleFavorite(characterEntity);
    final bool isCharacterFavorites = state[characterEntity.id] != null;

    if (isCharacterFavorites) {
      state.remove(characterEntity.id);
      state = { ...state };
    } else {
      state = { ...state, characterEntity.id: characterEntity };
    }
  }

  
}