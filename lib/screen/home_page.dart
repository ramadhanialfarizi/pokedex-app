import 'package:flutter/material.dart';
import 'package:pokedex_app/controller/provider.dart';
import 'package:pokedex_app/model/pokemon_list.dart';
import 'package:pokedex_app/screen/fail_load_data/fail_load_data.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final prov = Provider.of<PokemonListProvider>(context, listen: false);
      prov.getAllPokemon();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 248, 247, 221),
      appBar: AppBar(
        title: Text(
          'Pokedex',
          style: TextStyle(
            color: Colors.black.withOpacity(0.6),
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        elevation: 0,
        //centerTitle: false,
        backgroundColor: Colors.transparent,
      ),
      // body: Stack(
      //   children: [
      //     // Positioned(
      //     //   top: -50,
      //     //   right: -50,
      //     //   child: Image.asset(
      //     //     'assets/pokeball.png',
      //     //     width: 200,
      //     //     fit: BoxFit.fitWidth,
      //     //   ),
      //     // ),
      //     // Positioned(
      //     //   top: 100,
      //     //   left: 20,
      //     //   child: Text(
      //     //     'Pokedex',
      //     //     style: TextStyle(
      //     //       color: Colors.black.withOpacity(0.6),
      //     //       fontWeight: FontWeight.bold,
      //     //       fontSize: 30,
      //     //     ),
      //     //   ),
      //     // ),
      //     Positioned(
      //       top: 150,
      //       bottom: 0,
      //       child: Expanded(
      //         child: GridView.count(
      //           shrinkWrap: true,
      //           crossAxisCount: 2,
      //           physics: const BouncingScrollPhysics(),
      //           children: [
      //             cardPokemon(context),
      //             cardPokemon(context),
      //             cardPokemon(context),
      //             cardPokemon(context),
      //             cardPokemon(context),
      //             cardPokemon(context),
      //             cardPokemon(context),
      //             cardPokemon(context),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      body: Consumer<PokemonListProvider>(
        builder:
            (BuildContext context, PokemonListProvider provider, Widget? _) {
          final isLoading = provider.state == PokemonListState.loading;
          final isError = provider.state == PokemonListState.error;

          if (isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (isError) {
            return const FailLoadDataScreen();
          } else {
            return Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: provider.pokemonData.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        '/detail',
                        arguments: PokemonModel(
                          image: provider.pokemonData[index].image,
                          name: provider.pokemonData[index].name!,
                          height: provider.pokemonData[index].height,
                          weight: provider.pokemonData[index].weight,
                          weakness: provider.pokemonData[index].weakness,
                          spawnChange: provider.pokemonData[index].spawnChange,
                          spawnTime: provider.pokemonData[index].spawnTime,
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 179, 255, 181),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Center(
                              child: Image.network(
                                  provider.pokemonData[index].image!),
                            ),
                            Container(
                              width: 100,
                              height: 25,
                              margin: const EdgeInsets.only(
                                right: 17.0,
                                left: 17.0,
                                bottom: 17.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 102, 202, 106),
                              ),
                              child: Center(
                                child: Text(
                                  provider.pokemonData[index].name!,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
