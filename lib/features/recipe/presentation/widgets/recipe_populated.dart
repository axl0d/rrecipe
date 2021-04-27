import 'package:flutter/material.dart';
import 'package:recipe_repository/recipe_repository.dart';
import 'package:rrecipes/features/recipe/presentation/pages/detail.dart';

class RecipePopulated extends StatelessWidget {
  final List<Recipe> recipes;
  final ValueGetter<Future<void>> onRefresh;

  const RecipePopulated({Key key, this.recipes, this.onRefresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            flexibleSpace: FlexibleSpaceBar(
              background: _SliverAppBarContent(),
              collapseMode: CollapseMode.pin,
            ),
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _RecipeCard(
                recipe: recipes[index],
              ),
              childCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}

class _SliverAppBarContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          right: -100,
          top: -150,
          child: Container(
            width: 350,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.green,
                  Colors.greenAccent,
                  Colors.grey,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(4.0, 4.0),
                  blurRadius: 10.0,
                )
              ],
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.restaurant,
                      size: 50,
                    ),
                    Card(
                      color: Colors.grey.shade600,
                      child: const SizedBox(
                        height: 8,
                        width: 50,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Discover ',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(
                    'New Recipes',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

class _RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const _RecipeCard({Key key, this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
        RecipeImageFitted(
          image: recipe.image,
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

class RecipeImageFitted extends StatelessWidget {
  final String image;

  const RecipeImageFitted({Key key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 250),
      child: RecipeImage(
        image: image,
      ),
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
  const RecipeImage({
    Key key,
    @required this.image,
    this.boxFit = BoxFit.cover,
  }) : super(key: key);

  final String image;
  final BoxFit boxFit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image ?? '',
      width: double.infinity,
      fit: boxFit,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes
                : null,
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) => const ErrorImage(),
    );
  }
}

class ErrorImage extends StatelessWidget {
  const ErrorImage();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.broken_image,
      ),
    );
  }
}
