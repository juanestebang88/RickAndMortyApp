import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty/domain/entities/character.dart';
import 'package:rick_morty/presentation/providers/characters/characters_repository_provider.dart';

final allCharactersProvider = StateNotifierProvider<CharactersNotifier, List<CharacterEntity>>((ref) {
  final fetchMoreCharacters = ref.watch(characterRepositoryProvider).getAllCharacters;

  return CharactersNotifier(fetchMoreCharacters: fetchMoreCharacters);
});

typedef CharacterCallback = Future<List<CharacterEntity>> Function({int page});

class CharactersNotifier extends StateNotifier<List<CharacterEntity>>{

  int currentPage = 0;
  CharacterCallback fetchMoreCharacters;

  CharactersNotifier({
    required this.fetchMoreCharacters
  }): super([]);

  Future<void> loadNextPage() async{
    currentPage++;

    final List<CharacterEntity> characters = await fetchMoreCharacters(page: currentPage);

    state = [...state, ...characters];
  }

}