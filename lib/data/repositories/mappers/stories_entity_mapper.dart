import '../../../domain/entities/story.dart';
import '../../models/story_model.dart';
import '../entity_mapper.dart';

class StoriesEntityMapper implements EntityMapper<StoryModel, Story> {
  @override
  Story toEntity(StoryModel model) {
    return Story(title: model.title);
  }
}
