import 'dart:io';

import 'package:spoonacular_api/spoonacular_api.dart';

void main() async {
  final spoonacularApiClient = SpoonacularApiClient();

  try {
    final recipes = await spoonacularApiClient.recipeRandom();
    recipes.forEach((recipe) => print('Recipes Random:  ${recipe.title}'));

    final recipe = await spoonacularApiClient.detailRecipe(639031);
    print('Detail Recipe:  ${recipe.title}');
  } on Exception catch (e) {
    print(e);
  }

  exit(0);
}
