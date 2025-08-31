import 'package:flutter/cupertino.dart';

import '../models/meals_response_model.dart';
import '../services/meal_service.dart';

class MealProvider extends ChangeNotifier {
  final MealService mealService;

  MealProvider(this.mealService);

  MealsResponse? mealsResponse;
  MealsSummaryResponse? mealsSummaryResponse;

  bool isLoading = false;
  String? error;
  List<String> areas = [];

  Future<void> fetchRandomMeal() async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      final result = await mealService.getRandomMeal();
      mealsResponse = result;
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getMealsByArea(String area) async {
    try {
      final data = await MealService.getMealsByArea(area);
      mealsSummaryResponse = data;
      notifyListeners();
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }

  Future<void> fetchAreas() async {
    areas = await mealService.fetchAreas();
    notifyListeners();
  }
}