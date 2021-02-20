import 'package:flutter/material.dart';
import 'package:recipe_repository/recipe_repository.dart';
import 'package:rrecipes/features/recipe/presentation/pages/detail.dart';

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
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailRecipePage(
              id: recipe.id,
            ),
          ),
        ),
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
        SizedBox(
          height: 184,
          width: MediaQuery.of(context).size.width,
          child: RecipeImage(
            image: recipe.image,
            boxFit: BoxFit.cover,
          ),
        ),
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

  const RecipeIcons({
    Key key,
    this.readyInMinutes,
    this.likes,
    this.servings,
    this.isCheap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const Icon(
                Icons.alarm,
                color: Colors.red,
              ),
              Text('$readyInMinutes mins'),
            ],
          ),
          Column(
            children: [
              const Icon(
                Icons.thumb_up,
                color: Colors.blue,
              ),
              Text('$likes likes'),
            ],
          ),
          Column(
            children: [
              const Icon(
                Icons.local_pizza,
                color: Colors.green,
              ),
              Text('$servings servings'),
            ],
          ),
          if (isCheap)
            Column(
              children: [
                const Icon(Icons.attach_money),
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
  final BoxFit boxFit;

  const RecipeImage({Key key, this.image, this.boxFit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Image.network(
      image,
      fit: boxFit,
      width: width,
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
      errorBuilder: (context, error, stackTrace) => SizedBox(
        width: width,
        child: Icon(Icons.broken_image),
      ),
    );
  }
}
