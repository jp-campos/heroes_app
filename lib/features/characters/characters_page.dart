import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/repositories/characters_repository.dart';
import '../../service_locator/locator.dart';
import 'characters_layout.dart';
import 'characters_view_model.dart';

class CharactersPage extends StatelessWidget {
  static const routeName = '/characters';
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          CharactersViewModel(repository: locator<CharactersRepository>()),
      child: const Scaffold(body: CharactersLayout()),
    );
  }
}
