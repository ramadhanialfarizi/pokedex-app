//import 'dart:developer' as developer;

class PokemonModel {
  String? id;
  String? name;
  String? image;
  String? height;
  String? weight;
  String? spawnTime;
  String? weakness;
  String? spawnChange;

  PokemonModel({
    this.id,
    this.name,
    this.image,
    this.height,
    this.weight,
    this.spawnTime,
    this.weakness,
    this.spawnChange,
  });

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
    weight = json['weight'];
    height = json['height'];
    spawnTime = json['spawn_time'];
    weakness = json['weaknesses'][0];
    spawnChange = json['spawn_chance'].toString();
  }
}
