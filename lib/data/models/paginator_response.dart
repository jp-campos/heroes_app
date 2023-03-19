import '../json_mapper.dart';

class PaginatorResponse<T> {
  PaginatorResponse({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
    required this.mapper,
  });

  int offset;
  int limit;
  int total;

  int count;

  JsonMapper<T> mapper;

  List<T> results;

  static PaginatorResponse<T> fromJson<T>(
    Map<String, dynamic> json,
    JsonMapper<T> resultMapper,
  ) {
    final data = json['data'];
    return PaginatorResponse(
      offset: data['offset'],
      limit: data['limit'],
      total: data['total'],
      count: data['count'],
      mapper: resultMapper,
      results: data['results']
          .map<T>(
            (resultJson) => resultMapper.fromJson(resultJson),
          )
          .toList(),
    );
  }
}
