import 'package:flutter/material.dart';
import 'package:pokedex_app/model/pokemon_list.dart';

class DetailPokemonScreen extends StatefulWidget {
  const DetailPokemonScreen({
    super.key,
  });
  //final PokemonModel pokemonModel = ModalRoute();

  @override
  State<DetailPokemonScreen> createState() => _DetailPokemonScreenState();
}

class _DetailPokemonScreenState extends State<DetailPokemonScreen> {
  @override
  Widget build(BuildContext context) {
    final parameter =
        ModalRoute.of(context)!.settings.arguments as PokemonModel;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 350.0,
            floating: true,
            stretch: true,
            backgroundColor: Color.fromARGB(255, 100, 220, 104),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Positioned(
                    top: -50,
                    right: -50,
                    child: Image.asset(
                      'assets/pokeball.png',
                      width: 200,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    child: Center(
                      child: Image.network(
                        parameter.image as String,
                        scale: 0.6,
                      ),
                    ),
                  ),
                ],
              ),
              title: Container(
                width: 150,
                height: 30,
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
                    parameter.name as String,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              centerTitle: false,
            ),
          ),
          customSliverList(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Name',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              parameter.name as String,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Height',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              parameter.height as String,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Weight',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              parameter.weight as String,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Spawn Time',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              parameter.spawnTime as String,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Weakness',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              parameter.weakness as String,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Spawn Chance',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              parameter.spawnChange as String,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget customSliverList() {
    return SliverToBoxAdapter(
      child: Container(
        color: Color.fromARGB(255, 100, 220, 104),
        height: 20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              height: 20,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
