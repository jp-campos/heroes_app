import '../../domain/entities/character.dart';
import '../models/character_model.dart';
import 'entity_mapper.dart';

class CharacterEntityMapper extends EntityMapper<CharacterModel, Character> {
  @override
  Character toEntity(CharacterModel model) {
    return Character(
      id: model.id,
      name: model.name,
      description: model.description,
      thumbnail: model.thumbnail,
    );
  }
}
