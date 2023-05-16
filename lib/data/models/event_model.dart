import '../json_mapper.dart';

class EventModel {
  EventModel({required this.title});
  final String title;
  static const JsonResponseMapper<EventModel> mapper = _mapper;
}

EventModel _mapper(Map<String, dynamic> json) =>
    EventModel(title: json['title']);
