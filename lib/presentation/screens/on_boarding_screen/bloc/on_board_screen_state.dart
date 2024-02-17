part of 'on_board_screen_bloc.dart';


class OnBoardScreenState extends Equatable{

  final String screens;

  const OnBoardScreenState({this.screens = '/'});

  OnBoardScreenState copyWith({ String? screens }) {
    return OnBoardScreenState(
      screens: screens ?? this.screens,
    );
  }

  @override
  List<Object> get props => [screens];
}

