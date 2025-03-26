import 'package:trash_squad/models/activity_model.dart';
import 'package:trash_squad/services/api_service.dart';

class ActivityControllerT {
  final ApiService _apiService = ApiService();

  Future<List<Activity>> fetchActivity() {
    return _apiService.fetchActivity();
  }
}
