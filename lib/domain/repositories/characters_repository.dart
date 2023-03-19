import '../entities/character.dart';
import '../entities/comic.dart';
import '../entities/event.dart';
import '../entities/series.dart';
import '../entities/story.dart';

abstract class CharactersRepository {
  Future<List<Character>> getCharactersPage();
  Future<List<Comic>> getCharactersComic(int characterId);
  Future<List<Event>> getCharactersEvents(int characterId);
  Future<List<Series>> getCharactersSeries(int characterId);
  Future<List<Story>> getCharactersStories(int characterId);
}
