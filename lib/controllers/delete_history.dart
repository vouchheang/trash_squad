import 'package:trash_squad/services/api_service.dart';

class DeleteHistoryController {
  final ApiService _apiService = ApiService();

  Future<void> cancelPickup(int pickupId) {
    return _apiService.cancelPickup(pickupId);
  }
}
