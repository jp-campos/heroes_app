import '../../core/http_client.dart';
import '../models/character_model.dart';
import '../models/comic_model.dart';
import '../models/event_model.dart';
import '../models/paginator_response.dart';
import '../models/series_model.dart';
import '../models/story_model.dart';

class CharactersApi {
  CharactersApi({required ComicHttpClient client}) : _client = client;

  final ComicHttpClient _client;
  final String _path = 'characters';
  Future<PaginatorResponse<CharacterModel>> getCharacters([
    int offset = 0,
  ]) async {
    final response =
        await _client.get(_path, params: {'offset': offset.toString()});
    return PaginatorResponse.fromJson<CharacterModel>(
      response,
      CharacterModelMapper(),
    );
  }

  Future<PaginatorResponse<ComicModel>> getCharacterComics(
    int characterId,
  ) async {
    final response = await _client.get('$_path/$characterId/comics');

    return PaginatorResponse.fromJson(response, CommiModelMapper());
  }

  Future<PaginatorResponse<EventModel>> getCharacterEvents(
    int characterId,
  ) async {
    final response = await _client.get('$_path/$characterId/events');

    return PaginatorResponse.fromJson<EventModel>(response, EventModelMapper());
  }

  Future<PaginatorResponse<SeriesModel>> getCharacterSeries(
    int characterId,
  ) async {
    final response = await _client.get('$_path/$characterId/series');

    return PaginatorResponse.fromJson<SeriesModel>(
      response,
      SeriesModelMapper(),
    );
  }

  Future<PaginatorResponse<StoryModel>> getCharacterStories(
    int characterId,
  ) async {
    final response = await _client.get('$_path/$characterId/stories');

    return PaginatorResponse.fromJson(response, StoryModelMapper());
  }
}
