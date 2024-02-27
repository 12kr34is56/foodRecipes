part of 'video_bloc.dart';

@immutable
abstract class VideoEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class FetchDishVideoEvent extends VideoEvent {
  final String dishName;

  FetchDishVideoEvent({required this.dishName});

  @override
  List<Object> get props => [dishName];
}
