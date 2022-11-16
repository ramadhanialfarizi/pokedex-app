import 'package:flutter/material.dart';

class DetailPokemonScreen extends StatelessWidget {
  const DetailPokemonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            expandedHeight: 350.0,
            floating: true,
            stretch: true,
            backgroundColor: Color.fromARGB(255, 100, 220, 104),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Pokemon Name',
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: false,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Expanded(
                            child: Text(
                              'Name',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Charmeleon',
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
                          const Expanded(
                            child: Text(
                              '0.71 m',
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
                          const Expanded(
                            child: Text(
                              '6.9 kg',
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
                          const Expanded(
                            child: Text(
                              'Charmeleon',
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
                          const Expanded(
                            child: Text(
                              'Charmeleon',
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
                              'Evolution',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Text(
                              'Charmeleon',
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
}
