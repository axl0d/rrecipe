import 'package:equatable/equatable.dart';

class Ingredient extends Equatable {
  final String name;
  final String imageUrl;

  const Ingredient({
    this.name,
    this.imageUrl,
  });

  @override
  List<Object> get props => [
        name,
        imageUrl,
      ];
}
