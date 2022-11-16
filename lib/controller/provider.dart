import 'package:flutter/material.dart';
import 'package:pokedex_app/model/pokemon_list.dart';
import 'package:pokedex_app/services/api_services.dart';

class PokemonListProvider extends ChangeNotifier {
  final APIservices apiServices = APIservices();
  List<PokemonModel> pokemonData = <PokemonModel>[];

  void getAllPokemon() async {
    pokemonData = await apiServices.getAllPokemon();
    notifyListeners();
  }
}
