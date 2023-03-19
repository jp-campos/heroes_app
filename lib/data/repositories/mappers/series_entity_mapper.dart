import '../../../domain/entities/series.dart';
import '../../models/series_model.dart';
import '../entity_mapper.dart';

class SeriesEntityMapper implements EntityMapper<SeriesModel, Series> {
  @override
  Series toEntity(SeriesModel model) {
    return Series(
      title: model.title,
      startYear: model.startYear.toString(),
      endYear: model.endYear.toString(),
    );
  }
}
