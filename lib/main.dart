import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/bloc_observer.dart';
import 'package:food_recipes/firebase_options.dart';
import 'app.dart';

void main() async{


  Bloc.observer = OnBoardingObserver();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(App());
}

