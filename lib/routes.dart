import 'package:flutter/cupertino.dart';

import 'features/character_detail/character_detail_page.dart';
import 'features/characters/characters_page.dart';

Map<String, WidgetBuilder> routes = {
  CharactersPage.routeName: (context) => const CharactersPage(),
  CharacterDetailPage.routeName: (context) => const CharacterDetailPage(),
};
