import 'package:trash_squad/models/user_model.dart';
import 'package:trash_squad/services/api_service.dart';

class ProfileController {
  final ApiService _apiService = ApiService();

  Future<List<User>> fetchProfile() {
    return _apiService.fetchProfile();
  }
}
