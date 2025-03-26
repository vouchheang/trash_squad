import 'package:trash_squad/models/points_model.dart';
import 'package:trash_squad/services/api_service.dart';

class PointsController {
  final ApiService _apiService = ApiService();

  Future<List<Points>> fetchPoints() {
    return _apiService.fetchPoints();
  }

}
