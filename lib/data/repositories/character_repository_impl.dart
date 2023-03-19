import '../../domain/entities/character.dart';
import '../../domain/entities/comic.dart';
import '../../domain/entities/event.dart';
import '../../domain/entities/series.dart';
import '../../domain/entities/story.dart';
import '../../domain/repositories/characters_repository.dart';
import '../api/character_api.dart';
import 'character_mapper.dart';
import 'mappers/comic_entity_mapper.dart';
import 'mappers/event_entity_mapper.dart';
import 'mappers/series_entity_mapper.dart';
import 'mappers/stories_entity_mapper.dart';

const _charactersPerPage = 20;

class CharactersRepositoryImpl implements CharactersRepository {
  CharactersRepositoryImpl({required CharactersApi api}) : _api = api;

  final CharactersApi _api;

  int _characterOffset = 0;
  @override
  Future<List<Character>> getCharactersPage() async {
    final response = await _api.getCharacters(_characterOffset);
    _characterOffset += _charactersPerPage;
    return response.results
        .map<Character>(CharacterEntityMapper().toEntity)
        .toList();
  }

  @override
  Future<List<Comic>> getCharactersComic(int characterId) async {
    final response = await _api.getCharacterComics(characterId);
    return response.results.map<Comic>(ComicEntityMapper().toEntity).toList();
  }

  @override
  Future<List<Event>> getCharactersEvents(int characterId) async {
    final response = await _api.getCharacterEvents(characterId);

    return response.results.map<Event>(EventEntityMapper().toEntity).toList();
  }

  @override
  Future<List<Series>> getCharactersSeries(int characterId) async {
    final response = await _api.getCharacterSeries(characterId);

    return response.results.map<Series>(SeriesEntityMapper().toEntity).toList();
  }

  @override
  Future<List<Story>> getCharactersStories(int characterId) async {
    final response = await _api.getCharacterStories(characterId);

    return response.results.map<Story>(StoriesEntityMapper().toEntity).toList();
  }
}
