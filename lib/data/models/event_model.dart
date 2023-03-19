import '../json_mapper.dart';

class EventModel {
  EventModel({required this.title});
  final String title;
}

class EventModelMapper implements JsonMapper<EventModel> {
  @override
  EventModel fromJson(Map<String, dynamic> json) {
    return EventModel(title: json['title']);
  }
}
