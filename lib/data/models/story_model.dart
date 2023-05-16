import '../json_mapper.dart';

class StoryModel {
  StoryModel({required this.title});
  final String title;
  static const JsonResponseMapper<StoryModel> mapper = _mapper;
}

StoryModel _mapper(Map<String, dynamic> json) =>
    StoryModel(title: json['title']);
