class MealsResponse {
  final List<Meal> meals;

  MealsResponse({required this.meals});

  factory MealsResponse.fromJson(Map<String, dynamic> json) {
    return MealsResponse(
      meals: (json['meals'] as List)
          .map((meal) => Meal.fromJson(meal))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'meals': meals.map((meal) => meal.toJson()).toList(),
    };
  }
}
class MealsSummaryResponse {
  final List<MealSummary> mealsSummy;

  MealsSummaryResponse({required this.mealsSummy});

  factory MealsSummaryResponse.fromJson(Map<String, dynamic> json) {
    return MealsSummaryResponse(
      mealsSummy: (json['meals'] as List)
          .map((meal) => MealSummary.fromJson(meal))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'meals': mealsSummy.map((meal) => meal.toJson()).toList(),
    };
  }
}
class MealSummary {
  final String idMeal;
  final String strMeal;
  final String strMealThumb;

  MealSummary({
    required this.idMeal,
    required this.strMeal,
    required this.strMealThumb,
  });

  factory MealSummary.fromJson(Map<String, dynamic> json) {
    return MealSummary(
      idMeal: json['idMeal']?.toString() ?? "",
      strMeal: json['strMeal'] ?? "Unknown Meal",
      strMealThumb: json['strMealThumb'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idMeal': idMeal,
      'strMeal': strMeal,
      'strMealThumb': strMealThumb,
    };
  }
}
class Meal {
  final String idMeal;
  final String strMeal;
  final String? strMealAlternate;
  final String? strCategory;
  final String? strArea;
  final String? strInstructions;
  final String strMealThumb;
  final String? strTags;
  final String? strYoutube;
  final String? strSource;
  final String? strImageSource;
  final String? strCreativeCommonsConfirmed;
  final String? dateModified;
  final List<String?> ingredients;
  final List<String?> measures;

  Meal({
    required this.idMeal,
    required this.strMeal,
    this.strMealAlternate,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    required this.strMealThumb,
    this.strTags,
    this.strYoutube,
    this.strSource,
    this.strImageSource,
    this.strCreativeCommonsConfirmed,
    this.dateModified,
    required this.ingredients,
    required this.measures,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    List<String?> ingredients = [];
    List<String?> measures = [];

    for (int i = 1; i <= 20; i++) {
      final ingredient = json['strIngredient$i'];
      final measure = json['strMeasure$i'];

      if (ingredient != null && ingredient.toString().trim().isNotEmpty) {
        ingredients.add(ingredient.toString());
        measures.add(measure?.toString() ?? "");
      }
    }

    return Meal(
      idMeal: json['idMeal']?.toString() ?? "",
      strMeal: json['strMeal'] ?? "Unknown Meal",
      strMealAlternate: json['strMealAlternate'],
      strCategory: json['strCategory'],
      strArea: json['strArea'],
      strInstructions: json['strInstructions'],
      strMealThumb: json['strMealThumb'] ?? "",
      strTags: json['strTags'],
      strYoutube: json['strYoutube'],
      strSource: json['strSource'],
      strImageSource: json['strImageSource'],
      strCreativeCommonsConfirmed: json['strCreativeCommonsConfirmed'],
      dateModified: json['dateModified'],
      ingredients: ingredients,
      measures: measures,
    );
  }

  Map<String, dynamic> toJson() {
    final data = {
      'idMeal': idMeal,
      'strMeal': strMeal,
      'strMealAlternate': strMealAlternate,
      'strCategory': strCategory,
      'strArea': strArea,
      'strInstructions': strInstructions,
      'strMealThumb': strMealThumb,
      'strTags': strTags,
      'strYoutube': strYoutube,
      'strSource': strSource,
      'strImageSource': strImageSource,
      'strCreativeCommonsConfirmed': strCreativeCommonsConfirmed,
      'dateModified': dateModified,
    };

    for (int i = 0; i < ingredients.length; i++) {
      data['strIngredient${i + 1}'] = ingredients[i];
      data['strMeasure${i + 1}'] = measures[i];
    }

    return data;
  }
}
