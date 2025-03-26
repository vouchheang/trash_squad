import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trash_squad/models/activity_model.dart';
import 'package:trash_squad/models/points_model.dart';
import 'package:trash_squad/models/history_model.dart';
import 'package:trash_squad/models/schedule_model.dart';
import 'package:trash_squad/models/user_model.dart';
import 'package:trash_squad/services/storage_service.dart';

class ApiService {
  static const String baseUrl = 'https://pay1.jetdev.life';
  final StorageService _storageService = StorageService();

  Future<User?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/account/login'),
      body: jsonEncode({'username': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final user = User.fromJson(jsonDecode(response.body));
      if (user.token != null) {
        await _storageService.saveToken(user.token!); // Save token
      }
      return user;
    }
    return null;
  }

  Future<bool> register(User user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/account/register'),
      body: jsonEncode(user.toJson()), // Includes password in the payload
      headers: {'Content-Type': 'application/json'},
    );
    return response.statusCode == 200;
  }

  Future<List<Activity>> fetchActivities({int limit = 20}) async {
    final token = await _storageService.getToken(); // Retrieve token
    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/api/account/activity?limit=$limit'),
      headers: {'Authorization': 'Bearer $token'}, // Use token
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Activity.fromJson(json)).toList();
    }
    return [];
  }

  Future<List<Points>> fetchPoints() async {
    final token = await _storageService.getToken(); // Retrieve token
    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/api/account/points'),
      headers: {'Authorization': 'Bearer $token'}, // Use token
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);

      if (jsonResponse is List) {
        // If response is already a list
        return jsonResponse.map((json) => Points.fromJson(json)).toList();
      } else if (jsonResponse is Map<String, dynamic>) {
        // If response is an object, convert it into a list with a single element
        return [Points.fromJson(jsonResponse)];
      } else {
        throw Exception('Unexpected data format');
      }
    } else {
      throw Exception('Failed to load points');
    }
  }

  Future<List<Activity>> fetchActivity({int limit = 3}) async {
    final token = await _storageService.getToken(); // Retrieve token
    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/api/account/activity?limit=$limit'),
      headers: {'Authorization': 'Bearer $token'}, // Use token
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Activity.fromJson(json)).toList();
    }
    return [];
  }

  Future<List<User>> fetchProfile() async {
    final token = await _storageService.getToken(); // Retrieve token
    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/api/account/user'),
      headers: {'Authorization': 'Bearer $token'}, // Use token
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);

      if (jsonResponse is List) {
        // If response is already a list
        return jsonResponse.map((json) => User.fromJson(json)).toList();
      } else if (jsonResponse is Map<String, dynamic>) {
        // If response is an object, convert it into a list with a single element
        return [User.fromJson(jsonResponse)];
      } else {
        throw Exception('Unexpected data format');
      }
    } else {
      throw Exception('Failed to load points');
    }
  }

  Future<List<History>> fetchHistories({int limit = 20}) async {
    final token = await _storageService.getToken(); // Retrieve token
    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/api/pickup/history?limit=$limit'),
      headers: {'Authorization': 'Bearer $token'}, // Use token
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => History.fromJson(json)).toList();
    }
    return [];
  }

  Future<void> cancelPickup(int pickupId) async {
    final token = await _storageService.getToken(); // Retrieve token
    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await http.delete(
      Uri.parse('$baseUrl/api/pickup/cancel/$pickupId'),
      headers: {'Authorization': 'Bearer $token'}, // Use token
    );

    if (response.statusCode == 200) {
      print('Pickup successfully canceled');
    } else {
      throw Exception('Failed to cancel pickup: ${response.body}');
    }
  }

  Future<Schedule?> schedulePickup(
    String date,
    String wasteTypes,
    String estimateWeight,
  ) async {
    final token = await _storageService.getToken();
    final response = await http.post(
      Uri.parse('$baseUrl/api/pickup/schedule'),
      body: jsonEncode({
        'date': date,
        'wasteTypes': [wasteTypes],
        'estimateWeight': estimateWeight,
      }),
      headers: {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final schedule = Schedule.fromJson(jsonDecode(response.body));
      print('Pickup schedule created successfully');
      if (schedule.token != null) {
        await _storageService.saveToken(schedule.token!);
      }
      return schedule;
    }
    return null;
  }
}
