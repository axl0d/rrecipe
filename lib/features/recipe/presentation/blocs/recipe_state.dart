part of 'recipe_cubit.dart';

enum RecipeStatus { initial, loading, success, failure }

extension RecipeStatusX on RecipeStatus {
  bool get isInitial => this == RecipeStatus.initial;
  bool get isLoading => this == RecipeStatus.loading;
  bool get isSuccess => this == RecipeStatus.success;
  bool get isFailure => this == RecipeStatus.failure;
}

class RecipeState extends Equatable {
  const RecipeState({
    this.status = RecipeStatus.initial,
    this.recipes,
  });

  RecipeState copyWith({
    RecipeStatus status,
    List<Recipe> recipes,
  }) {
    return RecipeState(
      status: status ?? this.status,
      recipes: recipes ?? this.recipes,
    );
  }

  final RecipeStatus status;
  final List<Recipe> recipes;

  @override
  List<Object> get props => [
        status,
        recipes,
      ];
}
