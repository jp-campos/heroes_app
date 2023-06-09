import '../json_mapper.dart';

class PaginatorResponse<T> {
  PaginatorResponse({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });

  int offset;
  int limit;
  int total;

  int count;

  List<T> results;

  static PaginatorResponse<T> fromJson<T>(
    Map<String, dynamic> json, {
    required JsonResponseMapper<T> contentMapper,
  }) {
    final data = json['data'];
    return PaginatorResponse(
      offset: data['offset'],
      limit: data['limit'],
      total: data['total'],
      count: data['count'],
      results: data['results']
          .map<T>(
            (resultJson) => contentMapper.call(resultJson),
          )
          .toList(),
    );
  }
}
