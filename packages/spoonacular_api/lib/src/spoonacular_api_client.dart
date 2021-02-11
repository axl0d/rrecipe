import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spoonacular_api/spoonacular_api.dart';

class HttpException implements Exception {}

class HttpRequestFailure implements Exception {
  const HttpRequestFailure(this.statusCode);

  final int statusCode;
}

class JsonDecodeException implements Exception {}

class JsonDeserializationException implements Exception {}

const authority = 'api.spoonacular.com';
const apiKey = 'YOUR APIKEY HERE';

class SpoonacularApiClient {
  SpoonacularApiClient({http.Client httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  Future<List<Recipe>> recipeRandom({limit = 10}) async {
    final uri = Uri.https(authority, '/recipes/random', {
      'apiKey': apiKey,
      'number': '$limit',
    });
    return _fetchRecipeList(uri);
  }

  Future<List<Recipe>> _fetchRecipeList(Uri uri) async {
    final body = await _fetchRecipes(uri);

    try {
      return List.from(body['recipes'])
          .map((item) => Recipe.fromJson(item))
          .toList();
    } on Exception {
      throw JsonDeserializationException();
    }
  }

  Future<Recipe> detailRecipe(int id) async {
    final uri = Uri.https(authority, '/recipes/$id/information', {
      'apiKey': apiKey,
    });

    final body = await _fetchRecipes(uri);
    try {
      return Recipe.fromJson(body);
    } on Exception {
      throw JsonDeserializationException();
    }
  }

  Future<Map<String, dynamic>> _fetchRecipes(Uri uri) async {
    http.Response response;

    try {
      response = await _httpClient.get(uri);
    } on Exception {
      throw HttpException();
    }

    if (response.statusCode != 200) {
      throw HttpRequestFailure(response.statusCode);
    }

    try {
      final body = json.decode(response.body);
      return body;
    } on Exception {
      throw JsonDecodeException();
    }
  }
}
