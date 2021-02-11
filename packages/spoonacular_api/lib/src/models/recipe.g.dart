// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return $checkedNew('Recipe', json, () {
    final val = Recipe(
      cheap: $checkedConvert(json, 'cheap', (v) => v as bool),
      pricePerServing: $checkedConvert(
          json, 'pricePerServing', (v) => (v as num)?.toDouble()),
      id: $checkedConvert(json, 'id', (v) => v as int),
      title: $checkedConvert(json, 'title', (v) => v as String),
      readyInMinutes: $checkedConvert(json, 'readyInMinutes', (v) => v as int),
      servings: $checkedConvert(json, 'servings', (v) => v as int),
      likes: $checkedConvert(json, 'aggregateLikes', (v) => v as int),
      image: $checkedConvert(json, 'image', (v) => v as String),
      summary: $checkedConvert(json, 'summary', (v) => v as String),
      instructions: $checkedConvert(json, 'instructions', (v) => v as String),
      ingredients: $checkedConvert(
          json,
          'extendedIngredients',
          (v) => (v as List)
              ?.map((e) => e == null
                  ? null
                  : Ingredient.fromJson(e as Map<String, dynamic>))
              ?.toList()),
    );
    return val;
  }, fieldKeyMap: const {
    'likes': 'aggregateLikes',
    'ingredients': 'extendedIngredients'
  });
}

// **************************************************************************
// JsonLiteralGenerator
// **************************************************************************

const _$recipeDumpJsonLiteral = {
  'recipes': [
    {
      'vegetarian': false,
      'vegan': false,
      'glutenFree': false,
      'dairyFree': false,
      'veryHealthy': false,
      'cheap': false,
      'veryPopular': false,
      'sustainable': false,
      'weightWatcherSmartPoints': 7,
      'gaps': 'no',
      'lowFodmap': false,
      'aggregateLikes': 11,
      'spoonacularScore': 8.0,
      'healthScore': 0.0,
      'creditsText':
          'Foodista.com – The Cooking Encyclopedia Everyone Can Edit',
      'license': 'CC BY 3.0',
      'sourceName': 'Foodista',
      'pricePerServing': 34.48,
      'extendedIngredients': [
        {
          'id': 1001,
          'aisle': 'Milk, Eggs, Other Dairy',
          'image': 'butter-sliced.jpg',
          'consistency': 'solid',
          'name': 'butter',
          'original': '2/3 cup butter, softened',
          'originalString': '2/3 cup butter, softened',
          'originalName': 'butter, softened',
          'amount': 0.6666666666666666,
          'unit': 'cup',
          'meta': ['softened'],
          'metaInformation': ['softened'],
          'measures': {
            'us': {'amount': 0.667, 'unitShort': 'cups', 'unitLong': 'cups'},
            'metric': {
              'amount': 157.725,
              'unitShort': 'ml',
              'unitLong': 'milliliters'
            }
          }
        },
        {
          'id': 4582,
          'aisle': 'Oil, Vinegar, Salad Dressing',
          'image': 'vegetable-oil.jpg',
          'consistency': 'liquid',
          'name': 'canola oil',
          'original': '4 tablespoons canola oil',
          'originalString': '4 tablespoons canola oil',
          'originalName': 'canola oil',
          'amount': 4.0,
          'unit': 'tablespoons',
          'meta': [],
          'metaInformation': [],
          'measures': {
            'us': {'amount': 4.0, 'unitShort': 'Tbsps', 'unitLong': 'Tbsps'},
            'metric': {'amount': 4.0, 'unitShort': 'Tbsps', 'unitLong': 'Tbsps'}
          }
        },
        {
          'id': 10019146,
          'aisle': 'Baking',
          'image': 'chocolate-chips.jpg',
          'consistency': 'solid',
          'name': 'chocolate chips',
          'original': '1/4 cup chocolate chips - dark chocolate or white',
          'originalString': '1/4 cup chocolate chips - dark chocolate or white',
          'originalName': 'chocolate chips - dark chocolate or white',
          'amount': 0.25,
          'unit': 'cup',
          'meta': ['dark', 'white'],
          'metaInformation': ['dark', 'white'],
          'measures': {
            'us': {'amount': 0.25, 'unitShort': 'cups', 'unitLong': 'cups'},
            'metric': {
              'amount': 59.147,
              'unitShort': 'ml',
              'unitLong': 'milliliters'
            }
          }
        },
        {
          'id': 1123,
          'aisle': 'Milk, Eggs, Other Dairy',
          'image': 'egg.png',
          'consistency': 'solid',
          'name': 'egg',
          'original': '1 egg',
          'originalString': '1 egg',
          'originalName': 'egg',
          'amount': 1.0,
          'unit': '',
          'meta': [],
          'metaInformation': [],
          'measures': {
            'us': {'amount': 1.0, 'unitShort': '', 'unitLong': ''},
            'metric': {'amount': 1.0, 'unitShort': '', 'unitLong': ''}
          }
        },
        {
          'id': 99040,
          'aisle': null,
          'image': null,
          'consistency': 'solid',
          'name': 'gf chocolate cake mix',
          'original':
              '1 15.25 oz package Betty Crocker Chocolate Fudge Cake Mix',
          'originalString':
              '1 15.25 oz package Betty Crocker Chocolate Fudge Cake Mix',
          'originalName': 'package Betty Crocker Chocolate Fudge Cake Mix',
          'amount': 15.25,
          'unit': 'oz',
          'meta': [],
          'metaInformation': [],
          'measures': {
            'us': {'amount': 15.25, 'unitShort': 'oz', 'unitLong': 'ounces'},
            'metric': {'amount': 432.33, 'unitShort': 'g', 'unitLong': 'grams'}
          }
        },
        {
          'id': 16098,
          'aisle': 'Nut butters, Jams, and Honey',
          'image': 'peanut-butter.png',
          'consistency': 'solid',
          'name': 'peanut butter',
          'original': '2 tablespoons peanut butter',
          'originalString': '2 tablespoons peanut butter',
          'originalName': 'peanut butter',
          'amount': 2.0,
          'unit': 'tablespoons',
          'meta': [],
          'metaInformation': [],
          'measures': {
            'us': {'amount': 2.0, 'unitShort': 'Tbsps', 'unitLong': 'Tbsps'},
            'metric': {'amount': 2.0, 'unitShort': 'Tbsps', 'unitLong': 'Tbsps'}
          }
        },
        {
          'id': 8120,
          'aisle': 'Cereal',
          'image': 'rolled-oats.jpg',
          'consistency': 'solid',
          'name': 'rolled oats',
          'original': '1 cup rolled oats',
          'originalString': '1 cup rolled oats',
          'originalName': 'rolled oats',
          'amount': 1.0,
          'unit': 'cup',
          'meta': [],
          'metaInformation': [],
          'measures': {
            'us': {'amount': 1.0, 'unitShort': 'cup', 'unitLong': 'cup'},
            'metric': {
              'amount': 236.588,
              'unitShort': 'ml',
              'unitLong': 'milliliters'
            }
          }
        },
        {
          'id': 2050,
          'aisle': 'Baking',
          'image': 'vanilla-extract.jpg',
          'consistency': 'liquid',
          'name': 'vanilla',
          'original': '1 teaspoon vanilla',
          'originalString': '1 teaspoon vanilla',
          'originalName': 'vanilla',
          'amount': 1.0,
          'unit': 'teaspoon',
          'meta': [],
          'metaInformation': [],
          'measures': {
            'us': {'amount': 1.0, 'unitShort': 'tsp', 'unitLong': 'teaspoon'},
            'metric': {
              'amount': 1.0,
              'unitShort': 'tsp',
              'unitLong': 'teaspoon'
            }
          }
        },
        {
          'id': 1077,
          'aisle': 'Milk, Eggs, Other Dairy',
          'image': 'milk.png',
          'consistency': 'liquid',
          'name': 'whole milk',
          'original': '1/4 cup whole milk',
          'originalString': '1/4 cup whole milk',
          'originalName': 'whole milk',
          'amount': 0.25,
          'unit': 'cup',
          'meta': ['whole'],
          'metaInformation': ['whole'],
          'measures': {
            'us': {'amount': 0.25, 'unitShort': 'cups', 'unitLong': 'cups'},
            'metric': {
              'amount': 59.147,
              'unitShort': 'ml',
              'unitLong': 'milliliters'
            }
          }
        }
      ],
      'id': 639031,
      'title': 'Chocolate Fudge Cookies',
      'readyInMinutes': 20,
      'servings': 24,
      'sourceUrl':
          'http://www.foodista.com/recipe/GZJMLM5F/chocolate-fudge-cookies',
      'image': 'https://spoonacular.com/recipeImages/639031-556x370.jpg',
      'imageType': 'jpg',
      'summary':
          'Chocolate Fudge Cookies might be just the dessert you are searching for. For <b>34 cents per serving</b>, this recipe <b>covers 2%</b> of your daily requirements of vitamins and minerals. This recipe makes 24 servings with <b>166 calories</b>, <b>2g of protein</b>, and <b>9g of fat</b> each. 11 person have tried and liked this recipe. If you have vanilla, canolan oil, egg, and a few other ingredients on hand, you can make it. From preparation to the plate, this recipe takes around <b>20 minutes</b>. All things considered, we decided this recipe <b>deserves a spoonacular score of 16%</b>. This score is rather bad. Try <a href="https://spoonacular.com/recipes/chocolate-fudge-cookies-605271">Chocolate Fudge Cookies</a>, <a href="https://spoonacular.com/recipes/day-6-chocolate-fudge-cherry-cookies-560170">Day 6: Chocolate Fudge Cherry Cookies</a>, and <a href="https://spoonacular.com/recipes/chocolate-fudge-zucchini-cookies-548200">Chocolate Fudge Zucchini Cookies</a> for similar recipes.',
      'cuisines': [],
      'dishTypes': [
        'antipasti',
        'starter',
        'snack',
        'appetizer',
        'antipasto',
        "hor d'oeuvre"
      ],
      'diets': [],
      'occasions': [],
      'instructions':
          '<ol><li>Preheat oven 350 degrees.</li><li>Using a stand mixer or food processor, combine all of the ingredients and mix until combined.</li><li>Spoon the dough onto prepared cookies sheets and press down gently with the back of a spoon.</li><li>Bake for 6-8 minutes.</li><li>Transfer to a wire rack and let cool.  Enjoy!</li></ol>',
      'analyzedInstructions': [
        {
          'name': '',
          'steps': [
            {
              'number': 1,
              'step':
                  'Preheat oven 350 degrees.Using a stand mixer or food processor, combine all of the ingredients and mix until combined.Spoon the dough onto prepared cookies sheets and press down gently with the back of a spoon.',
              'ingredients': [
                {
                  'id': 10118192,
                  'name': 'cookies',
                  'localizedName': 'cookies',
                  'image': 'shortbread-cookies.jpg'
                },
                {
                  'id': 0,
                  'name': 'dough',
                  'localizedName': 'dough',
                  'image': 'pizza-dough'
                }
              ],
              'equipment': [
                {
                  'id': 404771,
                  'name': 'food processor',
                  'localizedName': 'food processor',
                  'image': 'food-processor.png'
                },
                {
                  'id': 404665,
                  'name': 'stand mixer',
                  'localizedName': 'stand mixer',
                  'image': 'stand-mixer.jpg'
                },
                {
                  'id': 404784,
                  'name': 'oven',
                  'localizedName': 'oven',
                  'image': 'oven.jpg'
                }
              ]
            },
            {
              'number': 2,
              'step': 'Bake for 6-8 minutes.',
              'ingredients': [],
              'equipment': [
                {
                  'id': 404784,
                  'name': 'oven',
                  'localizedName': 'oven',
                  'image': 'oven.jpg'
                }
              ],
              'length': {'number': 8, 'unit': 'minutes'}
            },
            {
              'number': 3,
              'step': 'Transfer to a wire rack and let cool.  Enjoy!',
              'ingredients': [],
              'equipment': [
                {
                  'id': 405900,
                  'name': 'wire rack',
                  'localizedName': 'wire rack',
                  'image': 'wire-rack.jpg'
                }
              ]
            }
          ]
        }
      ],
      'originalId': null,
      'spoonacularSourceUrl':
          'https://spoonacular.com/chocolate-fudge-cookies-639031'
    }
  ]
};
