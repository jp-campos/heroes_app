import 'package:flutter/cupertino.dart';

import '../../domain/entities/character.dart';
import '../../domain/entities/comic.dart';
import '../../domain/entities/event.dart';
import '../../domain/entities/series.dart';
import '../../domain/entities/story.dart';
import '../../domain/repositories/characters_repository.dart';

class CharacterDetailViewModel extends ChangeNotifier {
  CharacterDetailViewModel({
    required Character character,
    required CharactersRepository repository,
  }) {
    _character = character;
    _repository = repository;
    _init();
  }

  int get comicsCount => _comics.length;
  int get eventsCount => _events.length;
  int get seriesCount => _series.length;
  int get storiesCount => _stories.length;

  late final CharactersRepository _repository;
  List<Comic> _comics = [];
  List<Event> _events = [];
  List<Series> _series = [];
  List<Story> _stories = [];

  bool noEvents = false;
  bool noSeries = false;
  bool noStories = false;

  Character get character => _character;
  late final Character _character;

  Comic getComic(int i) => _comics[i];
  Event getEvent(int i) => _events[i];
  Series getSeries(int i) => _series[i];
  Story getStory(int i) => _stories[i];

  void _init() async {
    _queryComics();
    _queryEvents();
    _querySeries();
    _queryStories();
  }

  Future<void> _queryComics() async {
    _comics = await _repository.getCharactersComic(character.id);
    notifyListeners();
  }

  Future<void> _queryEvents() async {
    _events = await _repository.getCharactersEvents(character.id);
    if (_events.isEmpty) noEvents = true;
    notifyListeners();
  }

  Future<void> _querySeries() async {
    _series = await _repository.getCharactersSeries(character.id);
    if (_series.isEmpty) noSeries = true;
    notifyListeners();
  }

  Future<void> _queryStories() async {
    _stories = await _repository.getCharactersStories(character.id);
    if (_stories.isEmpty) noStories = true;
    notifyListeners();
  }
}
