import '../../../domain/entities/comic.dart';
import '../../models/comic_model.dart';
import '../entity_mapper.dart';

class ComicEntityMapper implements EntityMapper<ComicModel, Comic> {
  @override
  Comic toEntity(ComicModel model) {
    return Comic(
      title: model.title,
      description: model.description,
      image: model.image,
    );
  }
}
