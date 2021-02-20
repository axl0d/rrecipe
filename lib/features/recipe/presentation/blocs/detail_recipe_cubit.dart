import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_repository/recipe_repository.dart';

part 'detail_recipe_state.dart';

class DetailRecipeCubit extends Cubit<DetailRecipeState> {
  DetailRecipeCubit(this._repository) : super(DetailRecipeState());

  final RecipeRepository _repository;

  Future<void> fetchDetailRecipe({int id}) async {
    emit(state.copyWith(status: DetailRecipeStatus.loading));
    try {
      final recipe = await _repository.getRecipe(id);
      emit(state.copyWith(recipe: recipe, status: DetailRecipeStatus.success));
    } on Exception {
      emit(state.copyWith(status: DetailRecipeStatus.failure));
    }
  }
}
