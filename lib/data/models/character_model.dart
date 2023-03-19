import '../json_mapper.dart';
import '../util/image_mapper.dart';

class CharacterModel {
  CharacterModel({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.description,
  });
  final int id;
  final String name;
  final String? thumbnail;
  final String description;
}

class CharacterModelMapper implements JsonMapper<CharacterModel> {
  @override
  CharacterModel fromJson(Map<String, dynamic> json) {
    final thumbnailJson = json['thumbnail'];
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      thumbnail: mapImage(thumbnailJson),
      description: json['description'],
    );
  }
}
