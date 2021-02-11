import 'package:spoonacular_api/spoonacular_api.dart';

class RecipeRepository {
  RecipeRepository({SpoonacularApiClient spoonacularApiClient})
      : _spoonacularApiClient = spoonacularApiClient ?? SpoonacularApiClient();

  final SpoonacularApiClient _spoonacularApiClient;

  Future<List<Recipe>> getRecipesRandom(int limit) async =>
      await _spoonacularApiClient.recipeRandom(limit: limit);

  Future<Recipe> getRecipe(int id) async =>
      await _spoonacularApiClient.detailRecipe(id);
}
