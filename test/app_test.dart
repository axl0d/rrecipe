import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:recipe_repository/recipe_repository.dart';
import 'package:rrecipes/app.dart';

class MockRecipeRepository extends Mock implements RecipeRepository {}

void main() {
  group('RecipeApp', () {
    RecipeRepository recipeRepository;

    setUp(() {
      recipeRepository = MockRecipeRepository();
    });

    test('requires a RecipeRepository', () async {
      expect(() => RecipeApp(recipeRepository: null), throwsAssertionError);
    });

    testWidgets('renders RecipeAppView', (tester) async {
      await tester.pumpWidget(RecipeApp(recipeRepository: recipeRepository));
      expect(find.byType(RecipeAppView), findsOneWidget);
    });
  });
}
