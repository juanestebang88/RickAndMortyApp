import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rick_morty/domain/datasources/local_storage_datasource.dart';
import 'package:rick_morty/domain/entities/character.dart';

class IsarDatasource extends LocalStorageDatasource {

  late Future<Isar> database;

  IsarDatasource(){
    database = openDatabase();
  }

  Future<Isar> openDatabase() async{
    final directory = await getApplicationCacheDirectory();

    if (Isar.instanceNames.isEmpty) await Isar.open([CharacterEntitySchema], directory: directory.path);
    
    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool> isCharacterFavorite(int characterId) async{
    final isar = await database;

    final CharacterEntity? isCharacterFavorite = await isar.characterEntitys
      .filter()
      .idEqualTo(characterId)
      .findFirst();
    
    return isCharacterFavorite != null;
  }

  @override
  Future<List<CharacterEntity>> loadCharactersFavorites({int limit = 10, offset = 0}) async{
    final isar = await database;

    final listCharacters = await isar.characterEntitys.where()
      .offset(offset)
      .limit(limit)
      .findAll();

    return listCharacters;
  }

  @override
  Future<void> toggleFavorite(CharacterEntity characterEntity) async{
    final isar = await database;
    
    final favoriteCharacter = await isar.characterEntitys.filter()
      .idEqualTo(characterEntity.id)
      .findFirst();

    if (favoriteCharacter != null) {
      isar.writeTxnSync(() => isar.characterEntitys.deleteSync( favoriteCharacter.isarId!));
      return;
    }

    isar.writeTxnSync(() => isar.characterEntitys.putSync(characterEntity));

  }

}