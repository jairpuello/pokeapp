class PokemonDetails {
  int id;
  String name;
  String imageUrl;
  List<String> types;
  List<String> abilities;
  int height;
  int weight;

  PokemonDetails({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.types,
    required this.abilities,
    required this.height,
    required this.weight,
  });

  factory PokemonDetails.fromJson(Map<String, dynamic> json) {
    final sprites = json['sprites'] ?? {};
    final other = sprites['other'] ?? {};
    final official = (other['official-artwork'] ?? {}) as Map<String, dynamic>;
    final home = (other['home'] ?? {}) as Map<String, dynamic>;
    final dream = (other['dream_world'] ?? {}) as Map<String, dynamic>;

    String imageUrl =
        (official['front_default'] ??
                home['front_default'] ??
                dream['front_default'] ??
                sprites['front_default'] ??
                '')
            as String;

    if (imageUrl.isEmpty && json['name'] != null) {
      imageUrl = 'https://img.pokemondb.net/artwork/large/${json['name']}.jpg';
    }

    return PokemonDetails(
      id: json['id'],
      name: json['name'],
      imageUrl: imageUrl,
      types: (json['types'] as List)
          .map((typeInfo) => typeInfo['type']['name'] as String)
          .toList(),
      abilities: (json['abilities'] as List)
          .map((abilityInfo) => abilityInfo['ability']['name'] as String)
          .toList(),
      height: json['height'],
      weight: json['weight'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'types': types,
      'abilities': abilities,
      'height': height,
      'weight': weight,
    };
  }
}
