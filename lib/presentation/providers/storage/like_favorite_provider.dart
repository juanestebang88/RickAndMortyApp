import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty/presentation/providers/storage/local_storage_provider.dart';

final isFavoriteProvider = FutureProvider.family.autoDispose((ref, int characterId){
  final localStorageProvider = ref.watch(localStorageRepositoryProvider);
  return localStorageProvider.isCharacterFavorite(characterId);
});