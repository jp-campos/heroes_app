import 'dart:async';

import '../../core/network/http_client.dart';
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
    final response = await _client.get<PaginatorResponse<CharacterModel>>(
      _path,
      queryParams: {'offset': offset.toString()},
      responseMapper: (json) => PaginatorResponse.fromJson(
        json,
        contentMapper: CharacterModel.mapper,
      ),
    );

    return response.getResultOrThrowError();
  }

  Future<PaginatorResponse<ComicModel>> getCharacterComics(
    int characterId,
  ) async {
    final response = await _client.get<PaginatorResponse<ComicModel>>(
      '$_path/$characterId/comics',
      responseMapper: (json) => PaginatorResponse.fromJson(
        json,
        contentMapper: ComicModel.mapper,
      ),
    );
    return response.getResultOrThrowError();
  }

  Future<PaginatorResponse<EventModel>> getCharacterEvents(
    int characterId,
  ) async {
    final response = await _client.get(
      '$_path/$characterId/events',
      responseMapper: (json) => PaginatorResponse.fromJson(
        json,
        contentMapper: EventModel.mapper,
      ),
    );
    return response.getResultOrThrowError();
  }

  Future<PaginatorResponse<SeriesModel>> getCharacterSeries(
    int characterId,
  ) async {
    final response = await _client.get(
      '$_path/$characterId/series',
      responseMapper: (json) => PaginatorResponse.fromJson(
        json,
        contentMapper: SeriesModel.mapper,
      ),
    );

    return response.getResultOrThrowError();
  }

  Future<PaginatorResponse<StoryModel>> getCharacterStories(
    int characterId,
  ) async {
    final response = await _client.get(
      '$_path/$characterId/stories',
      responseMapper: (json) =>
          PaginatorResponse.fromJson(json, contentMapper: StoryModel.mapper),
    );

    return response.getResultOrThrowError();
  }
}
