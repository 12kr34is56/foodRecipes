part of 'cuisine_bloc.dart';


enum CuisineStatus { initial, loading, success, failure }

@immutable
class CuisineState extends Equatable{
  final String cuisineName;
  final List<Results> cuisine;
  final CuisineStatus status;

  const CuisineState({this.cuisine = const[], this.status = CuisineStatus.initial, this.cuisineName = ''});

  CuisineState copyWith({List<Results>? cuisine, CuisineStatus? status, String? cuisineName}) {
    return CuisineState(
      cuisine: cuisine ?? this.cuisine,
      status: status ?? this.status,
      cuisineName: cuisineName ?? this.cuisineName,
    );
  }

  @override
  List<Object> get props => [cuisine, status, cuisineName];
}

