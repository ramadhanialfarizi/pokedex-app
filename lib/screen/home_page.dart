import 'package:flutter/material.dart';
import 'package:pokedex_app/controller/provider.dart';
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
          if (provider.pokemonData.isEmpty) {
            return const Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Center(
                child: Text('No have data'),
              ),
            );
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: provider.pokemonData.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/detail');
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
                          Text(provider.pokemonData[index].name!),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
