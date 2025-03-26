import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trash_squad/models/schedule_model.dart';

// Define the base class for all schedule-related events.
abstract class ScheduleEvent {}

// Event to set a new schedule.
class SetScheduleEvent extends ScheduleEvent {
  final Schedule schedule;

  SetScheduleEvent(this.schedule);
}

// Define the base class for all schedule-related states.
abstract class ScheduleState {}

// Initial state when no schedule is loaded.
class ScheduleInitial extends ScheduleState {}

// State representing a loaded schedule.
class ScheduleLoaded extends ScheduleState {
  final Schedule schedule;

  ScheduleLoaded(this.schedule);
}

// Bloc to handle schedule events and manage schedule states.
class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  ScheduleBloc() : super(ScheduleInitial()) {
    // Handle the SetScheduleEvent by emitting a ScheduleLoaded state.
    on<SetScheduleEvent>((event, emit) {
      emit(ScheduleLoaded(event.schedule));
    });
  }
}
