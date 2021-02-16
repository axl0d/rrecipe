import 'package:spoonacular_api/spoonacular_api.dart' hide Recipe, Ingredient;

import 'models/models.dart';

class RecipeRepository {
  RecipeRepository({SpoonacularApiClient spoonacularApiClient})
      : _spoonacularApiClient = spoonacularApiClient ?? SpoonacularApiClient();

  final SpoonacularApiClient _spoonacularApiClient;

  Future<List<Recipe>> getRecipesRandom(int limit) async {
    final recipesRandom =
        await _spoonacularApiClient.recipeRandom(limit: limit);
    return recipesRandom
        .map((r) => Recipe(
              id: r.id,
              instructions: r.instructionList,
              image: r.image,
              cheap: r.cheap,
              readyInMinutes: r.readyInMinutes,
              likes: r.likes,
              servings: r.servings,
              pricePerServing: r.pricePerServing,
              summary: r.cleanedSummary,
              title: r.title,
              ingredients: r.ingredients
                  .map(
                    (i) => Ingredient(
                      name: i.name,
                      imageUrl: i.image,
                    ),
                  )
                  .toList(),
            ))
        .toList();
  }

  Future<Recipe> getRecipe(int id) async {
    final r = await _spoonacularApiClient.detailRecipe(id);
    return Recipe(
      id: r.id,
      instructions: r.instructionList,
      image: r.image,
      cheap: r.cheap,
      readyInMinutes: r.readyInMinutes,
      likes: r.likes,
      servings: r.servings,
      pricePerServing: r.pricePerServing,
      summary: r.cleanedSummary,
      title: r.title,
      ingredients: r.ingredients
          .map(
            (i) => Ingredient(
              name: i.name,
              imageUrl: i.image,
            ),
          )
          .toList(),
    );
  }
}
