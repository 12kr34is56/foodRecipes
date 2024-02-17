part of 'on_board_screen_bloc.dart';

@immutable
abstract class OnBoardScreenEvent extends Equatable {
  const OnBoardScreenEvent();

  @override
  List<Object> get props => [];
}

class NavigationToSignUp extends OnBoardScreenEvent {}

class NavigationToSignIn extends OnBoardScreenEvent {}
