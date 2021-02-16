import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_repository/recipe_repository.dart';

part 'recipe_state.dart';

class RecipeCubit extends Cubit<RecipeState> {
  RecipeCubit(this._repository) : super(RecipeState());

  final RecipeRepository _repository;

  Future<void> fetchRecipes() async {
    emit(state.copyWith(status: RecipeStatus.loading));
    try {
      final recipes = await _repository.getRecipesRandom(10);
      emit(state.copyWith(recipes: recipes, status: RecipeStatus.success));
    } on Exception {
      emit(state.copyWith(status: RecipeStatus.failure));
    }
  }
}
