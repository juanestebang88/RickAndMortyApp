import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rick_morty/infrastructure/datasources/character_datasource.dart';
import 'package:rick_morty/infrastructure/repositories/character_repository_impl.dart';

final characterRepositoryProvider = Provider((ref) {
    return CharactersRepositoryImpl(CharacterDatasource());
});