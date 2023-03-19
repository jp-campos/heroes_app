import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/character_card.dart';
import 'characters_view_model.dart';

class CharactersLayout extends StatelessWidget {
  const CharactersLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CharactersViewModel>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: NotificationListener<ScrollNotification>(
            onNotification: viewModel.onScrollNotification,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: viewModel.characterCount,
              itemBuilder: (context, index) {
                final character = viewModel.getCharacter(index);

                return CharacterCard(
                  id: character.id,
                  name: character.name,
                  thumbnail: character.thumbnail,
                  onTap: () => viewModel.onCharacterTapped(
                    context: context,
                    character: character,
                  ),
                );
              },
            ),
          ),
        ),
        if (viewModel.paginationLoading)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: CircularProgressIndicator.adaptive(),
          )
      ],
    );
  }
}
