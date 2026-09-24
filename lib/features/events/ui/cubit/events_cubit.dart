import 'package:evently/core/networking/api_result.dart';
import 'package:evently/features/events/data/models/event_model.dart';
import 'package:evently/features/events/data/repo/events_repo.dart';
import 'package:evently/features/events/ui/cubit/events_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventsCubit extends Cubit<EventsState> {
  final EventsRepo _eventsRepo;

  EventsCubit(this._eventsRepo)
    : super(EventsState(status: EventStatus.initial));

  Future<void> getEvents() async {
    emit(EventsState(status: EventStatus.loading));

    final result = await _eventsRepo.getEvents();
    if (result is Success<List<EventModel>>) {
      emit(EventsState(status: EventStatus.success, events: result.data));
    } else if (result is Error<List<EventModel>>) {
      emit(EventsState(status: EventStatus.error, message: result.error));
    }
  }
}
