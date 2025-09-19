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
    return PokemonDetails(
      id: json['id'],
      name: json['name'],
      imageUrl: json['sprites']['front_default'],
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
