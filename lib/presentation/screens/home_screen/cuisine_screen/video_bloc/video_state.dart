part of 'video_bloc.dart';


enum VideoStatus { initial, loading, success, failure }

class VideoState extends Equatable{
  final String dishName;
  final FoodVideoModel videos;
  final VideoStatus status;

  const VideoState({required this.videos, this.status = VideoStatus.initial, this.dishName = ''});

  VideoState copyWith({FoodVideoModel? videos, VideoStatus? status, String? dishName}) {
    return VideoState(
      videos: videos ?? this.videos,
      status: status ?? this.status,
      dishName: dishName ?? this.dishName,
    );
  }

  @override
  List<Object> get props => [videos, status, dishName];
}

