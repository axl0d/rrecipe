import 'package:equatable/equatable.dart';

import 'ingredient.dart';

class Recipe extends Equatable {
  final bool cheap;
  final double pricePerServing;
  final int id;
  final String title;
  final int readyInMinutes;
  final int servings;
  final int likes;
  final String image;
  final String summary;
  final List<String> instructions;
  final List<Ingredient> ingredients;

  const Recipe({
    this.cheap,
    this.pricePerServing,
    this.id,
    this.title,
    this.readyInMinutes,
    this.servings,
    this.likes,
    this.image,
    this.summary,
    this.instructions,
    this.ingredients,
  });

  @override
  List<Object> get props => [
        cheap,
        pricePerServing,
        id,
        title,
        readyInMinutes,
        servings,
        likes,
        image,
        summary,
        instructions,
        ingredients,
      ];
}
