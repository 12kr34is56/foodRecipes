import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_recipes/data/spoonacular_API.dart';
import 'package:meta/meta.dart';

import '../../../../../model/FoodModel.dart';

part 'cuisine_event.dart';
part 'cuisine_state.dart';

class CuisineBloc extends Bloc<CuisineEvent, CuisineState> {
  CuisineBloc() : super(const CuisineState()) {
    on<FetchCuisineEvent>(fetchCuisineEvent);
  }

  Future<FutureOr<void>> fetchCuisineEvent(
      FetchCuisineEvent event, Emitter<CuisineState> emit) async {
    emit(state.copyWith(status: CuisineStatus.loading));

    final FoodModel foodUser =
        await SpoonacularApi.getFoodData(name: event.cuisine);

    emit(state.copyWith(
        status: CuisineStatus.success,
        cuisine: foodUser.results!,
        cuisineName: event.cuisine));
  }


}
