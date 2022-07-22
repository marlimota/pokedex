import 'package:flutter/material.dart';
import 'package:pokedex/features/domain/entities/pokemon.dart';
import 'package:pokedex/features/presentation/home_page/widgets/pokemon_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.pokemonsList}) : super(key: key);

  final List<PokemonEntity> pokemonsList;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<PokemonEntity> filtredPokemonList =
      List<PokemonEntity>.from(widget.pokemonsList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 248, 246),
      appBar: AppBar(
        shadowColor: const Color.fromARGB(255, 33, 60, 56),
        backgroundColor: const Color.fromARGB(255, 0, 157, 120),
        title: const AppBarTitle(),
      ),
      body: Stack(
        children: [
          const BackgroundScreens(),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.87,
                      child: TextField(
                        cursorColor: Colors.green,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            size: 32,
                            color: Color.fromARGB(255, 3, 149, 125),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 61, 186, 166),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(18),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 6, 134, 112),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(18),
                            ),
                          ),
                          // border: OutlineInputBorder(
                          //   borderSide: BorderSide(
                          //     color: Color.fromARGB(255, 3, 149, 125),
                          //     width: 5,
                          //   ),
                          //   borderRadius: BorderRadius.all(
                          //     Radius.circular(20),
                          //   ),
                          // ),
                        ),
                        onChanged: (searchTerm) {
                          setState(() {
                            filtredPokemonList =
                                List<PokemonEntity>.from(widget.pokemonsList);
                            filtredPokemonList.removeWhere((element) => !element
                                .name
                                .toLowerCase()
                                .contains(searchTerm.toLowerCase()));
                          });
                        },
                      )),
                ],
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  children: filtredPokemonList
                      .map(
                        (e) => PokemonCard(
                          pokemon: e,
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BackgroundScreens extends StatelessWidget {
  const BackgroundScreens({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          'assets/images/logo.png',
          repeat: ImageRepeat.repeat,
          scale: 4.5,
          color: const Color.fromARGB(30, 17, 187, 173),
        ),
      ),
    );
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Text(
            'Pokedex',
            style: TextStyle(
              height: 3,
              fontFamily: 'Moderna',
              fontSize: 42,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 6
                ..color = const Color.fromARGB(181, 163, 197, 190),
              //color: Color.fromARGB(255, 232, 249, 247),
            ),
          ),
        ),
        const Center(
          child: Text(
            'Pokedex',
            style: TextStyle(
              height: 3,
              fontFamily: 'Moderna',
              fontSize: 42,
              color: Color.fromARGB(255, 232, 249, 247),
            ),
          ),
        ),
      ],
    );
  }
}

//font pokemon com contorno no texto
      //title:
      // Center(
      //   child: Stack(
      //     children: [
      //       Text(
      //         'Pokedéx',
      //         style: TextStyle(
      //           fontFamily: 'Pokemon',
      //           fontSize: 32,
      //           //color: Colors.amber,
      //           foreground: Paint()
      //             ..style = PaintingStyle.stroke
      //             ..strokeWidth = 8
      //             ..color = const Color.fromARGB(255, 41, 108, 209),
      //         ),
      //       ),
      //       const Text(
      //         'Pokedéx',
      //         style: TextStyle(
      //           fontFamily: 'Pokemon',
      //           fontSize: 32.5,
      //           color: Color.fromARGB(255, 250, 210, 48),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      //),