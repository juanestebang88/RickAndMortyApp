
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty/infrastructure/datasources/isar_datasource.dart';
import 'package:rick_morty/infrastructure/repositories/local_storage_repository_impl.dart';

final localStorageRepositoryProvider = Provider((ref) {
  return LocalStorageRepositoryImpl(datasource: IsarDatasource());
});



