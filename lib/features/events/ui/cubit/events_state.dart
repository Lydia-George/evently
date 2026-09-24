import 'package:evently/features/events/data/models/event_model.dart';

enum EventStatus { initial, loading, success, error }

class EventsState {
  final EventStatus status;
  final List<EventModel> events;
  final String? message;

  const EventsState({
    required this.status,
    this.events = const [],
    this.message,
  });
}
