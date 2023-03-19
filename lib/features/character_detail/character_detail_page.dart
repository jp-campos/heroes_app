import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/character.dart';
import '../../service_locator/locator.dart';
import 'character_detail_layout.dart';
import 'character_detail_view_model.dart';

class CharacterDetailPage extends StatelessWidget {
  static const routeName = '/character_detail';

  const CharacterDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final character = ModalRoute.of(context)!.settings.arguments as Character;
    return ChangeNotifierProvider<CharacterDetailViewModel>(
      create: (_) => CharacterDetailViewModel(
        character: character,
        repository: locator(),
      ),
      child: const Scaffold(
        body: CharacterDetailLayout(),
      ),
    );
  }
}
