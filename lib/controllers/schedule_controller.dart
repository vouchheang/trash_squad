import 'package:trash_squad/bloc/schedule_bloc.dart';
import 'package:trash_squad/models/schedule_model.dart';
import 'package:trash_squad/services/api_service.dart';

class ScheduleController {
  final ApiService _apiService = ApiService();

  Future<Schedule?> pickupSchedule(
    String date,
    String wasteTypes,
    String estimateWeight, [
    ScheduleBloc? scheduleBloc,
  ]) async {
    final schedule = await _apiService.schedulePickup(
      date,
      wasteTypes,
      estimateWeight,
    );
    if (schedule != null && scheduleBloc != null) {
      scheduleBloc.add(SetScheduleEvent(schedule));
    }
    return schedule;
  }
}
