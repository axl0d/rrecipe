import 'package:flutter/material.dart';
import 'package:recipe_repository/recipe_repository.dart';

class RecipePopulated extends StatelessWidget {
  final List<Recipe> recipes;

  const RecipePopulated({Key key, this.recipes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recipes.length,
      itemBuilder: (context, index) => _RecipeCard(recipe: recipes[index]),
    );
  }
}

class _RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const _RecipeCard({Key key, this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 338,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        margin: const EdgeInsets.all(8),
        child: _RecipeCardContent(
          recipe: recipe,
        ),
      ),
    );
  }
}

class _RecipeCardContent extends StatelessWidget {
  final Recipe recipe;

  const _RecipeCardContent({Key key, this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RecipeImage(image: recipe.image),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                recipe.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline5,
              ),
              RecipeIcons(
                isCheap: recipe.cheap,
                servings: recipe.servings,
                likes: recipe.likes,
                readyInMinutes: recipe.readyInMinutes,
              )
            ],
          ),
        )
      ],
    );
  }
}

class RecipeIcons extends StatelessWidget {
  final int readyInMinutes, likes, servings;
  final bool isCheap;

  const RecipeIcons(
      {Key key, this.readyInMinutes, this.likes, this.servings, this.isCheap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Icon(
                Icons.alarm,
                color: Colors.red,
              ),
              Text('$readyInMinutes mins'),
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.thumb_up,
                color: Colors.blue,
              ),
              Text('$likes likes'),
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.local_pizza,
                color: Colors.green,
              ),
              Text('$servings servings'),
            ],
          ),
          if (isCheap)
            Column(
              children: [
                Icon(Icons.attach_money),
                Text('cheap'),
              ],
            ),
        ],
      ),
    );
  }
}

class RecipeImage extends StatelessWidget {
  final String image;

  const RecipeImage({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 184,
      width: MediaQuery.of(context).size.width,
      child: Image.network(
        image,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          if (loadingProgress != null &&
              loadingProgress.cumulativeBytesLoaded <
                  loadingProgress.expectedTotalBytes) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (loadingProgress.cumulativeBytesLoaded ==
              loadingProgress.expectedTotalBytes) {
            return child;
          }
          return child;
        },
        errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image),
      ),
    );
  }
}
