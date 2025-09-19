import 'package:flutter/material.dart';
import 'package:test_flutter/models/pokemon_models.dart';
import 'package:test_flutter/services/pokemon_services.dart';

class PokemonProvider extends ChangeNotifier {
  final PokemonServices _pokemonServices = PokemonServices();
  List<PokemonModels> _pokemons = [];
  bool _isLoading = false;

  List<PokemonModels> get pokemons => _pokemons;
  bool get isLoading => _isLoading;

  Future<void> fetchPokemons() async {
    _isLoading = true;
    notifyListeners();
    try {
      _pokemons = await _pokemonServices.fetchPokemons();
    } catch (e) {
      _pokemons = [];
    }
    _isLoading = false;
    notifyListeners();
  }
}
