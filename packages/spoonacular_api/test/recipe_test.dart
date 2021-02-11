import 'package:json_annotation/json_annotation.dart';
import 'package:spoonacular_api/spoonacular_api.dart';
import 'package:test/test.dart';

void main() {
  group('Recipe', () {
    group('fromJson', () {
      test('throws CheckedFromJsonException when source is null', () {
        expect(
          () => Recipe.fromJson(null),
          throwsA(isA<CheckedFromJsonException>()),
        );
      });
    });
  });
}
