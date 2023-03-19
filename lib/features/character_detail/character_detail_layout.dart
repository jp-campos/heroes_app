import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/comic_card.dart';
import '../../widgets/nullable_image.dart';
import 'character_detail_view_model.dart';

class CharacterDetailLayout extends StatelessWidget {
  const CharacterDetailLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CharacterDetailViewModel>();
    return CustomScrollView(
      slivers: [
        _Appbar(
          id: viewModel.character.id,
          name: viewModel.character.name,
          thumbnail: viewModel.character.thumbnail,
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              viewModel.character.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
        const _Subtitle(subtitle: 'Comics'),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: viewModel.comicsCount,
              separatorBuilder: (_, __) => const SizedBox(width: 20),
              itemBuilder: (context, index) {
                final comic = viewModel.getComic(index);

                if (comic.image == null) {
                  return SizedBox(
                    width: 130,
                    child: Text(comic.title),
                  );
                }

                return SizedBox(
                  height: 200,
                  child: ComicImage(image: comic.image),
                );
              },
            ),
          ),
        ),
        const _Subtitle(subtitle: 'Events'),
        if (viewModel.noEvents)
          _NoContent(
            contentName: 'events',
            characterName: viewModel.character.name,
          ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _PagePadding(
                vertical: 10,
                child: Text(viewModel.getEvent(index).title),
              );
            },
            childCount: viewModel.eventsCount,
          ),
        ),
        const _Subtitle(subtitle: 'Series'),
        if (viewModel.noSeries)
          _NoContent(
            contentName: 'series',
            characterName: viewModel.character.name,
          ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: viewModel.seriesCount,
            (context, index) {
              return _PagePadding(
                child: Text(viewModel.getSeries(index).title),
              );
            },
          ),
        ),
        const _Subtitle(subtitle: 'Stories'),
        if (viewModel.noSeries)
          _NoContent(
            contentName: 'stories',
            characterName: viewModel.character.name,
          ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: viewModel.storiesCount,
            (context, index) {
              return _PagePadding(
                child: Text(viewModel.getStory(index).title),
              );
            },
          ),
        )
      ],
    );
  }
}

class _NoContent extends StatelessWidget {
  const _NoContent({
    required this.contentName,
    required this.characterName,
  });
  final String contentName;
  final String characterName;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: _PagePadding(
        child: Text('No events for $characterName'),
      ),
    );
  }
}

class _PagePadding extends StatelessWidget {
  const _PagePadding({required this.child, this.vertical = 10});

  final Widget child;
  final double vertical;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: vertical),
      child: child,
    );
  }
}

class _Subtitle extends StatelessWidget {
  const _Subtitle({
    required this.subtitle,
  });

  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Text(
          subtitle,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}

class _Appbar extends StatelessWidget {
  const _Appbar({
    required this.id,
    required this.name,
    required this.thumbnail,
  });

  final int id;
  final String name;
  final String? thumbnail;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      leading: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.surface,
        ),
        child: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          color: Theme.of(context).colorScheme.primary,
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Container(
          color: Theme.of(context).colorScheme.surface,
          padding: const EdgeInsets.all(5),
          child: Text(
            name,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        background: Hero(
          tag: id,
          child: NullableNetworkImage(url: thumbnail),
        ),
      ),
    );
  }
}
