part of 'cuisine_bloc.dart';

@immutable
abstract class CuisineEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class FetchCuisineEvent extends CuisineEvent {
  final String cuisine;

  FetchCuisineEvent({required this.cuisine});

  @override
  List<Object> get props => [cuisine];
}
