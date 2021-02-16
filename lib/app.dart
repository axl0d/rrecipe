import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_repository/recipe_repository.dart';

import 'features/recipe/presentation/pages/home.dart';

class RecipeApp extends StatelessWidget {
  const RecipeApp({
    Key key,
    @required RecipeRepository recipeRepository,
  })  : assert(recipeRepository != null),
        _recipeRepository = recipeRepository,
        super(key: key);

  final RecipeRepository _recipeRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _recipeRepository,
      child: RecipeAppView(),
    );
  }
}

class RecipeAppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random-Recipes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
