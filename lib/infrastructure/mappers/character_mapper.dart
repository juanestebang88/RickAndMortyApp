import 'package:rick_morty/domain/entities/character.dart';
import 'package:rick_morty/infrastructure/models/character_model.dart';

class CharacterMapper {
  static CharacterEntity characterToEntity(CharacterModel character) => CharacterEntity(
    id: character.id,
    name: character.name,
    status: character.status,
    species: character.species,
    type: character.type,
    gender: character.gender,
    origin: character.origin,
    location: character.location,
    image: character.image,
    episode: character.episode,
    url: character.url,
    created: character.created
  );
}
