import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/presentation/cubit/pokemon_cubit.dart';
import 'package:pokedex/features/presentation/home_page/home_page_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: BlocProvider<PokemonCubit>(
        create: (context) => PokemonCubit(),
        child: const HomePageContainer())
    );
  }
}
