import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_repository/recipe_repository.dart';
import 'package:rrecipes/features/recipe/presentation/blocs/recipe_cubit.dart';
import 'package:rrecipes/features/recipe/presentation/widgets/recipe_loading.dart';
import 'package:rrecipes/features/recipe/presentation/widgets/recipe_populated.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecipeCubit(
        context.read<RecipeRepository>(),
      )..fetchRecipes(),
      child: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RecipeCubit, RecipeState>(
        builder: (context, state) {
          switch (state.status) {
            case RecipeStatus.success:
              return RecipePopulated(recipes: state.recipes);
            case RecipeStatus.failure:
            case RecipeStatus.loading:
            default:
              return RecipeLoading();
          }
        },
      ),
    );
  }
}
