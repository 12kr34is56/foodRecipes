import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_recipes/model/food_video_model.dart';
import 'package:meta/meta.dart';

import '../../../../../data/spoonacular_API.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  VideoBloc() : super(VideoState(videos: FoodVideoModel())) {
    on<FetchDishVideoEvent>(fetchDishVideoEvent);
  }

  Future<FutureOr<void>> fetchDishVideoEvent(
      FetchDishVideoEvent event, Emitter<VideoState> emit) async {
    emit(state.copyWith(status: VideoStatus.loading));
    try {
      await SpoonacularApi.getDishVideo(dishName: event.dishName).then((value) {
        emit(state.copyWith(
            status: VideoStatus.success, dishName: event.dishName, videos: value));
      });
    } catch (e) {
      emit(state.copyWith(
          status: VideoStatus.failure, dishName: event.dishName));
    }
  }
}
