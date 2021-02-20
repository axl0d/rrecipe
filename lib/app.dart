import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
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
        textTheme: recipeTextTheme,
      ),
      home: HomePage(),
    );
  }
}

final recipeTextTheme = GoogleFonts.latoTextTheme().copyWith(
  headline4: GoogleFonts.lato(
    color: Colors.grey.shade800,
    fontWeight: FontWeight.w600,
  ),
  headline5: GoogleFonts.lato(
    color: Colors.grey.shade800,
    fontWeight: FontWeight.w900,
  ),
  bodyText1: GoogleFonts.lato(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  ),
  bodyText2: GoogleFonts.lato(
    fontSize: 17,
    height: 1.7,
    color: Colors.grey.shade600,
    letterSpacing: 0.8,
  ),
);
