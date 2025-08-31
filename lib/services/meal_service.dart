import 'dart:convert';

import 'package:http/http.dart' as http;

import '../core/network/api_client.dart';
import '../core/network/api_constants.dart';
import '../models/meals_response_model.dart';

class MealService{
  final ApiClient apiClient;

  MealService(this.apiClient);
  Future<MealsResponse> getRandomMeal() async {
    final response = await apiClient.get("${ApiConstants.baseUrl}/random.php");
    return MealsResponse.fromJson(response);
  }
  static Future<MealsSummaryResponse> getMealsByArea(String area) async {
    final url = Uri.parse("${ApiConstants.baseUrl}/filter.php?a=$area");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final mealsSummy = (data['meals'] as List)
          .map((meal) => MealSummary.fromJson(meal))
          .toList();

      return MealsSummaryResponse(mealsSummy: mealsSummy);
    } else {
      throw Exception("Failed to load meals by area");
    }
  }
  Future<List<String>> fetchAreas() async {
    final response = await apiClient.get("${ApiConstants.baseUrl}/list.php?a=list");
    final meals = response['meals'] as List<dynamic>;
    return meals.map((area) => area['strArea'] as String).toList();
  }
}