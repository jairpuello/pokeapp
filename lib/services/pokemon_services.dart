import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_flutter/models/pokemon_details.dart';
import 'package:test_flutter/models/pokemon_models.dart';

class PokemonServices {
  final String apiUrl = 'https://pokeapi.co/api/v2/pokemon';

  Future<List<PokemonModels>> fetchPokemons() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      return data.map((json) => PokemonModels.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Pokemon');
    }
  }

  Future<PokemonDetails> fetchPokemonDetails(int id) async {
    final response = await http.get(Uri.parse('$apiUrl/$id'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return PokemonDetails.fromJson(data);
    } else {
      throw Exception('Failed to load Pokemon details');
    }
  }
}
