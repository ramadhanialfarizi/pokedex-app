import 'package:flutter/material.dart';
import 'package:pokedex_app/model/pokemon_list.dart';
import 'package:pokedex_app/services/api_services.dart';

enum PokemonListState {
  none,
  loading,
  error,
}

class PokemonListProvider extends ChangeNotifier {
  PokemonListState _state = PokemonListState.none;
  PokemonListState get state => _state;

  final APIservices apiServices = APIservices();
  List<PokemonModel> pokemonData = <PokemonModel>[];

  void changeState(PokemonListState viewState) {
    _state = viewState;
    notifyListeners();
  }

  void getAllPokemon() async {
    changeState(PokemonListState.loading);

    try {
      pokemonData = await apiServices.getAllPokemon();
      notifyListeners();

      changeState(PokemonListState.none);
    } on Exception catch (e) {
      //log(e.toString());
      changeState(PokemonListState.error);
    }
  }
}
