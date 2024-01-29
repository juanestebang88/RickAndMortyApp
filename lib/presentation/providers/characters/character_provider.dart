import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty/domain/entities/character.dart';
import 'package:rick_morty/presentation/providers/characters/characters_repository_provider.dart';

final detailCharacterProvider = StateNotifierProvider<CharacterMapNotifier, Map<String, CharacterEntity>>((ref) {
  final fethcCharacter = ref.watch(characterRepositoryProvider);
  return CharacterMapNotifier(getCharacter: fethcCharacter.getCharacter);
});

typedef GetCharacterCallback = Future<CharacterEntity> Function({String characterId});
class CharacterMapNotifier extends StateNotifier<Map<String, CharacterEntity>> {
  final GetCharacterCallback getCharacter;

  CharacterMapNotifier({required this.getCharacter}) : super({});

  Future<void> loadCharacter(String characterId) async {
    if (state[characterId] != null) return;
    final character = await getCharacter( characterId: characterId);
    state = { ...state, characterId: character };
  }
  
}