import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_repository/recipe_repository.dart';
import 'package:rrecipes/features/recipe/presentation/widgets/recipe_populated.dart';

class DetailRecipePopulated extends StatelessWidget {
  final Recipe recipe;

  const DetailRecipePopulated({Key key, this.recipe}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _DetailRecipeImage(image: recipe.image),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    recipe.title,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                RecipeIcons(
                  isCheap: recipe.cheap,
                  servings: recipe.servings,
                  likes: recipe.likes,
                  readyInMinutes: recipe.readyInMinutes,
                ),
                const _DetailRecipeBodyTitle(
                  title: 'Ingredients',
                ),
                _IngredientList(ingredients: recipe.ingredients),
                const _DetailRecipeBodyTitle(
                  title: 'Instructions',
                ),
              ]),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: recipe.instructions.length > 1
                  ? SliverChildBuilderDelegate(
                      (context, index) => Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card(
                                  color: Colors.orangeAccent.shade100,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '${index + 1}',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    recipe.instructions[index],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                        ],
                      ),
                      childCount: recipe.instructions.length,
                    )
                  : SliverChildListDelegate(
                      [
                        Text(
                          recipe.instructions.first,
                        ),
                      ],
                    ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const _DetailRecipeBodyTitle(
                    title: 'About',
                  ),
                  Text(
                    recipe.summary,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailRecipeImage extends StatelessWidget {
  final String image;

  const _DetailRecipeImage({Key key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          child: RecipeImage(
            image: image,
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.7),
            child: BackButton(
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}

class _DetailRecipeBodyTitle extends StatelessWidget {
  final String title;

  const _DetailRecipeBodyTitle({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}

class _IngredientList extends StatelessWidget {
  final List<Ingredient> ingredients;

  const _IngredientList({Key key, this.ingredients}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        itemCount: ingredients.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            _IngredientItem(ingredient: ingredients[index]),
      ),
    );
  }
}

class _IngredientItem extends StatelessWidget {
  final Ingredient ingredient;

  const _IngredientItem({Key key, this.ingredient}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 2,
              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade400, width: 0.3),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RecipeImage(
                    image: ingredient.imageUrl,
                    boxFit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  ingredient.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
