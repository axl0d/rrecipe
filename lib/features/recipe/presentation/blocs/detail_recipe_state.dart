part of 'detail_recipe_cubit.dart';

enum DetailRecipeStatus { initial, loading, success, failure }

class DetailRecipeState extends Equatable {
  const DetailRecipeState({
    this.recipe,
    this.status = DetailRecipeStatus.initial,
  });

  final Recipe recipe;
  final DetailRecipeStatus status;

  DetailRecipeState copyWith({
    DetailRecipeStatus status,
    Recipe recipe,
  }) {
    return DetailRecipeState(
      status: status ?? this.status,
      recipe: recipe ?? this.recipe,
    );
  }

  @override
  List<Object> get props => [recipe, status];
}
