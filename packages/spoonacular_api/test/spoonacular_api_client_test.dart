import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:spoonacular_api/spoonacular_api.dart';
import 'package:test/test.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}

void main() {
  group('SpoonacularApiClient', () {
    http.Client httpClient;
    SpoonacularApiClient spoonacularApiClient;

    setUp(() {
      httpClient = MockHttpClient();
      spoonacularApiClient = SpoonacularApiClient(httpClient: httpClient);
    });

    group('constructor', () {
      test('does not require an httpClient', () {
        expect(SpoonacularApiClient(), isNotNull);
      });
    });

    group('Fetch random recipes', () {
      const limit = 1;
      final response = MockResponse();

      test('makes correct http request to Api from random recipe', () async {
        when(response.statusCode).thenReturn(200);
        when(response.body).thenReturn(jsonEncode(recipeDump));
        when(httpClient.get(any)).thenAnswer((_) async => response);
        await spoonacularApiClient.recipeRandom(limit: limit);
        verify(
          httpClient.get(
            Uri.https(authority, '/recipes/random', {
              'apiKey': apiKey,
              'number': '$limit',
            }),
          ),
        ).called(1);
      });

      test('throws RequestFailure on non-200 response', () async {
        when(response.statusCode).thenReturn(400);
        when(httpClient.get(any)).thenAnswer((_) async => response);
        expect(
          () async => await spoonacularApiClient.recipeRandom(),
          throwsA(isA<HttpRequestFailure>()),
        );
      });

      test('return Recipe Model from random recipe', () async {
        when(response.statusCode).thenReturn(200);
        when(response.body).thenReturn(jsonEncode(recipeDump));
        when(httpClient.get(any)).thenAnswer((_) async => response);
        final recipes = await spoonacularApiClient.recipeRandom(limit: limit);
        expect(
          recipes.first,
          isA<Recipe>()
              .having((r) => r.title, 'title', 'Chocolate Fudge Cookies'),
        );
      });
    });

    group('Fetch detail recipe', () {
      const id = 639031;
      final response = MockResponse();

      test('makes correct http request to Api from detail recipe', () async {
        when(response.statusCode).thenReturn(200);
        when(response.body).thenReturn(jsonEncode(recipeDump));
        when(httpClient.get(any)).thenAnswer((_) async => response);
        await spoonacularApiClient.detailRecipe(id);
        verify(
          httpClient.get(
            Uri.https(authority, '/recipes/$id/information', {
              'apiKey': apiKey,
            }),
          ),
        ).called(1);
      });

      test('throws RequestFailure on non-200 response', () async {
        when(response.statusCode).thenReturn(400);
        when(httpClient.get(any)).thenAnswer((_) async => response);
        expect(
          () async => await spoonacularApiClient.detailRecipe(id),
          throwsA(
            isA<HttpRequestFailure>(),
          ),
        );
      });

      test('return Recipe Model from detail recipe', () async {
        final responseDump = jsonEncode(recipeDump['recipes'].first);

        when(response.statusCode).thenReturn(200);
        when(response.body).thenReturn(responseDump);
        when(httpClient.get(any)).thenAnswer((_) async => response);
        final recipe = await spoonacularApiClient.detailRecipe(id);
        expect(
          recipe,
          isA<Recipe>()
              .having((r) => r.title, 'title', 'Chocolate Fudge Cookies'),
        );
      });
    });
  });
}
