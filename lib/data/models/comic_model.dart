import '../json_mapper.dart';
import '../util/image_mapper.dart';

class ComicModel {
  ComicModel({
    required this.title,
    required this.description,
    required this.image,
  });

  final String title;
  final String description;
  final String? image;

  static const JsonResponseMapper<ComicModel> mapper = _mapper;
}

ComicModel _mapper(Map<String, dynamic> json) {
  List<String?> images =
      json['images'].map<String?>((image) => mapImage(image)).toList();
  return ComicModel(
    title: json['title'],
    description: json['description'] ?? '',
    image: images.isNotEmpty ? images.first : null,
  );
}
