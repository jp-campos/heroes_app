import 'package:flutter/cupertino.dart';

import '../../domain/entities/character.dart';
import '../../domain/repositories/characters_repository.dart';
import '../character_detail/character_detail_page.dart';

class CharactersViewModel extends ChangeNotifier {
  CharactersViewModel({required CharactersRepository repository}) {
    _repository = repository;
    _init();
  }

  List<Character> _characters = [];

  int get characterCount => _characters.length;

  bool loading = true;
  bool paginationLoading = false;
  bool noMoreLoaded = false;

  late final CharactersRepository _repository;

  Character getCharacter(int i) => _characters[i];

  void onCharacterTapped({
    required BuildContext context,
    required Character character,
  }) {
    Navigator.of(context).pushNamed(
      CharacterDetailPage.routeName,
      arguments: character,
    );
  }

  bool onScrollNotification(ScrollNotification notification) {
    if (paginationLoading) return true;
    if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
      _fetchMoreCharacters();
    }

    return true;
  }

  void _fetchMoreCharacters() async {
    _setPaginationLoading(true);

    final newCharacters = await _repository.getCharactersPage();
    if (newCharacters.isEmpty) {
      noMoreLoaded = true;
    }
    _characters += newCharacters;
    _setPaginationLoading(false);

    notifyListeners();
  }

  void _init() async {
    _characters = await _repository.getCharactersPage();
    loading = false;
    notifyListeners();
  }

  void _setPaginationLoading(bool loading) {
    paginationLoading = loading;
    notifyListeners();
  }
}
