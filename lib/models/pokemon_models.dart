class PokemonModels {
  int id;
  String name;
  String url;
  String imageUrl = '';
  PokemonModels({
    required this.id,
    required this.name,
    required this.url,
    required this.imageUrl,
  });

  factory PokemonModels.fromJson(Map<String, dynamic> json) {
    final id = int.parse(
      json['url'].split('/')[json['url'].split('/').length - 2],
    );
    return PokemonModels(
      id: id,
      name: json['name'],
      url: json['url'],
      imageUrl: 'https://img.pokemondb.net/artwork/large/${json['name']}.jpg',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'url': url,
      'sprites': {'front_default': imageUrl},
    };
  }
}

class PokemonList {
  List<PokemonModels> pokemons;
  PokemonList({required this.pokemons});

  factory PokemonList.fromJson(Map<String, dynamic> json) {
    var list = json['results'] as List;
    List<PokemonModels> pokemonList = list
        .map((i) => PokemonModels.fromJson(i))
        .toList();
    return PokemonList(pokemons: pokemonList);
  }

  Map<String, dynamic> toJson() {
    return {'results': pokemons.map((e) => e.toJson()).toList()};
  }
}
