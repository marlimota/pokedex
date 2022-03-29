import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/data/repositories/pokemon_repository_impl.dart';
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
      home: HomePageContainer(
        repository: PokemonRepositoryImpl(dio: Dio()),
      ),
    );
  }
}
