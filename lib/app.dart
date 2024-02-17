import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/data/data_source/auth/auth_datasource.dart';
import 'package:food_recipes/domain/repository/authentication_repository/authentication_repository.dart';
import 'package:food_recipes/presentation/routes/routes.dart';
import 'package:food_recipes/presentation/screens/auth_screen/sign_in_screen/sign_in_bloc/sign_in_bloc.dart';
import 'package:food_recipes/presentation/screens/auth_screen/sign_up_screen/bloc/sign_up_bloc.dart';
import 'package:food_recipes/presentation/screens/on_boarding_screen/bloc/on_board_screen_bloc.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
  AuthDataSource _dataSource = AuthDataSource();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OnBoardScreenBloc(),
        ),
        BlocProvider(
          create: (context) => SignUpBloc(AuthenticationRepositoryImpl(_dataSource)),
        ),
        BlocProvider(
          create: (context) => SignInBloc(AuthenticationRepositoryImpl(_dataSource)),
        ),


      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            inputDecorationTheme: const InputDecorationTheme(
                errorStyle: TextStyle(fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w500)
            )
        ),
        routerConfig: Routes.route,
      ),
    );
  }
}
