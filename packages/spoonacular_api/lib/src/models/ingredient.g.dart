// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ingredient _$IngredientFromJson(Map<String, dynamic> json) {
  return $checkedNew('Ingredient', json, () {
    final val = Ingredient(
      image: $checkedConvert(
          json, 'image', (v) => Ingredient._imagePath(v as String)),
      name: $checkedConvert(json, 'name', (v) => v as String),
    );
    return val;
  });
}
