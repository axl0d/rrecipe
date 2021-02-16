import 'package:json_annotation/json_annotation.dart';

part 'ingredient.g.dart';

@JsonSerializable(checked: true, createToJson: false)
class Ingredient {
  @JsonKey(fromJson: _imagePath)
  final String image;
  final String name;

  const Ingredient({
    this.image,
    this.name,
  });

  static String _imagePath(String image) => '$ingredientImageUrl$image';

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
}

const String ingredientImageUrl =
    'https://spoonacular.com/cdn/ingredients_100x100/';
