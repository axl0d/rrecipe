import 'package:flutter/material.dart';
import 'package:recipe_repository/recipe_repository.dart';

import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(RecipeApp(recipeRepository: RecipeRepository()));
}
