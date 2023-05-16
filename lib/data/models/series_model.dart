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
  static const JsonResponseMapper<SeriesModel> mapper = _mapper;
}

SeriesModel _mapper(Map<String, dynamic> json) => SeriesModel(
      title: json['title'],
      startYear: json['startYear'],
      endYear: json['endYear'],
    );
