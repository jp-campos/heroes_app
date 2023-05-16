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
  static const JsonResponseMapper<CharacterModel> mapper = _mapper;
}

CharacterModel _mapper(Map<String, dynamic> json) {
  final thumbnailJson = json['thumbnail'];
  return CharacterModel(
    id: json['id'],
    name: json['name'],
    thumbnail: mapImage(thumbnailJson),
    description: json['description'],
  );
}
