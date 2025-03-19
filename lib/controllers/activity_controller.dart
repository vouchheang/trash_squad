import 'package:trash_squad/models/activity_model.dart';
import 'package:trash_squad/services/api_service.dart';

class ActivityController {
  final ApiService _apiService = ApiService();

  Future<List<Activity>> fetchActivities() {
    return _apiService.fetchActivities();
  }
}
