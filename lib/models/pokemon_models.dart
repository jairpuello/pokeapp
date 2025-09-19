class PokemonModels {
  String name;
  String url;
  String imageUrl = '';
  PokemonModels({
    required this.name,
    required this.url,
    required this.imageUrl,
  });

  factory PokemonModels.fromJson(Map<String, dynamic> json) {
    return PokemonModels(
      name: json['name'],
      url: json['url'],
      imageUrl: 'https://img.pokemondb.net/artwork/large/${json['name']}.jpg',
    );
  }

  Map<String, dynamic> toJson() {
    return {
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
