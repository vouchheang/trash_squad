import 'package:trash_squad/models/history_model.dart';
import 'package:trash_squad/services/api_service.dart';

class HistoryController {
  final ApiService _apiService = ApiService();

  Future<List<History>> fetchHistories() {
    return _apiService.fetchHistories();
  }
}
