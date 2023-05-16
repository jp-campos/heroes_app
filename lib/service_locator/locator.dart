import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

import '../core/network/http_client.dart';
import '../data/api/character_api.dart';
import '../data/repositories/character_repository_impl.dart';
import '../domain/repositories/characters_repository.dart';
import '../env_keys.dart';

final locator = GetIt.instance;

void initDependencies() {
  locator.registerLazySingleton<ComicHttpClient>(
    () {
      final publicKey = dotenv.get(EnvKeys.publicKey);
      final privateKey = dotenv.get(EnvKeys.privateKey);

      return ComicHttpClient(
        authority: dotenv.get(EnvKeys.authority),
        basePath: dotenv.get(EnvKeys.basePath),
        privateKey: privateKey,
        publicKey: publicKey,
      );
    },
  );

  locator.registerLazySingleton<CharactersApi>(
    () => CharactersApi(client: locator()),
  );

  locator.registerLazySingleton<CharactersRepository>(
    () => CharactersRepositoryImpl(api: locator()),
  );
}
