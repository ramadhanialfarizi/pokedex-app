//import 'dart:developer' as developer;

class PokemonModel {
  String? id;
  String? name;
  String? image;

  PokemonModel({this.id, this.name, this.image});

  // factory PokemonList.fromJson(Map<String, dynamic> json) {
  //   return PokemonList(
  //     id: json['id'].toString(),
  //     name: json['name'],
  //     image: json['img'],
  //   );
  // }

  PokemonModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'];
    image = json['img'];
  }
}
