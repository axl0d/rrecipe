import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_repository/recipe_repository.dart';
import 'package:rrecipes/features/recipe/presentation/blocs/detail_recipe_cubit.dart';
import 'package:rrecipes/features/recipe/presentation/widgets/detail_recipe_populated.dart';
import 'package:rrecipes/features/recipe/presentation/widgets/recipe_loading.dart';

class DetailRecipePage extends StatelessWidget {
  final int id;

  const DetailRecipePage({Key key, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailRecipeCubit(
        context.read<RecipeRepository>(),
      )..fetchDetailRecipe(id: id),
      child: DetailRecipeView(),
    );
  }
}

class DetailRecipeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailRecipeCubit, DetailRecipeState>(
        builder: (context, state) {
          switch (state.status) {
            case DetailRecipeStatus.success:
              return DetailRecipePopulated(recipe: state.recipe);
            case DetailRecipeStatus.failure:
            case DetailRecipeStatus.loading:
            default:
              return RecipeLoading();
          }
        },
      ),
    );
  }
}
