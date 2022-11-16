//import 'dart:convert';
import 'dart:developer';
// import 'dart:io';

import 'package:pokedex_app/model/pokemon_list.dart';
import 'package:dio/dio.dart';

class APIservices {
  // https://pokeapi.co/api/v2/pokemon/
  //String name = '';

  Future<List<PokemonModel>> getAllPokemon() async {
    try {
      final response = await Dio().get(
          'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');

      log(response.data);

      if (response.statusCode == 200) {
        //return PokemonList.fromJson(jsonDecode(response.data));
        // Iterable iterable = jsonDecode(response.data);
        // List<PokemonList> pokemonList =
        //     iterable.map((e) => PokemonList.fromJson(e)).toList();
        // return pokemonList;

        List<dynamic> pokemonData =
            (response.data as Map<String, dynamic>)['pokemon'];

        List<PokemonModel> pokemonList = [];
        for (int loop = 0; loop < pokemonData.length; loop++) {
          pokemonList.add(PokemonModel.fromJson(pokemonData[loop]));
        }
        return pokemonList;
      } else {
        throw Exception('failed to load data');
      }
    } catch (e) {
      rethrow;
    }
  }
}
