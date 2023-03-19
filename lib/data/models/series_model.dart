import '../json_mapper.dart';

class SeriesModel {
  SeriesModel({
    required this.title,
    required this.startYear,
    required this.endYear,
  });

  final String title;
  final int startYear;
  final int endYear;
}

class SeriesModelMapper implements JsonMapper<SeriesModel> {
  @override
  SeriesModel fromJson(Map<String, dynamic> json) {
    return SeriesModel(
      title: json['title'],
      startYear: json['startYear'],
      endYear: json['endYear'],
    );
  }
}
