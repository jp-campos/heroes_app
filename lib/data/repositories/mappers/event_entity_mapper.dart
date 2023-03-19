import '../../../domain/entities/event.dart';
import '../../models/event_model.dart';
import '../entity_mapper.dart';

class EventEntityMapper implements EntityMapper<EventModel, Event> {
  @override
  Event toEntity(EventModel model) {
    return Event(title: model.title);
  }
}
