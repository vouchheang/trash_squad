import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trash_squad/models/activity_model.dart';

// Define the base class for all activity-related events
abstract class ActivityEvent {}

// Event to set a list of activities
class SetActivitiesEvent extends ActivityEvent {
  final List<Activity> activities;
  SetActivitiesEvent(this.activities);
}

// Define the base class for all activity-related states
abstract class ActivityState {}

// Initial state when no activities are loaded
class ActivityInitial extends ActivityState {}

// State representing loaded activities
class ActivityLoaded extends ActivityState {
  final List<Activity> activities;
  ActivityLoaded(this.activities);
}

// Bloc to handle activity events and manage activity states
class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  ActivityBloc() : super(ActivityInitial()) {
    // Handle the SetActivitiesEvent by emitting an ActivityLoaded state
    on<SetActivitiesEvent>((event, emit) {
      emit(ActivityLoaded(event.activities));
    });
  }
}