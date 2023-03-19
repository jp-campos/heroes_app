import '../json_mapper.dart';

class StoryModel {
  StoryModel({required this.title});
  final String title;
}

class StoryModelMapper implements JsonMapper<StoryModel> {
  @override
  StoryModel fromJson(Map<String, dynamic> json) {
    return StoryModel(title: json['title']);
  }
}
