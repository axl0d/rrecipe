import 'package:json_annotation/json_annotation.dart';
import 'package:spoonacular_api/src/models/ingredient.dart';

part 'recipe.g.dart';

@JsonSerializable(checked: true, createToJson: false)
class Recipe {
  final bool cheap;
  final double pricePerServing;
  final int id;
  final String title;
  final int readyInMinutes;
  final int servings;
  @JsonKey(name: 'aggregateLikes')
  final int likes;
  final String image;
  final String summary;
  final String instructions;
  @JsonKey(name: 'extendedIngredients')
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

  List<String> get instructionList =>
      instructions.split(exp).where((i) => i.isNotEmpty).toList();

  String get cleanedSummary => summary.replaceAll(exp, '');

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}

final exp = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);

@JsonLiteral('recipe.json', asConst: true)
Map get recipeDump => _$recipeDumpJsonLiteral;
