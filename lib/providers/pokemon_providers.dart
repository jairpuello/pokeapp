import 'package:flutter/material.dart';
import 'package:test_flutter/models/pokemon_details.dart';
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

class PokemonDetailsProvider extends ChangeNotifier {
  final PokemonServices _pokemonServices = PokemonServices();
  PokemonDetails? _pokemon;
  bool _isLoading = false;

  PokemonDetails? get pokemon => _pokemon;
  bool get isLoading => _isLoading;

  Future<void> fetchPokemonDetails(int id) async {
    _isLoading = true;
    notifyListeners();
    try {
      _pokemon = await _pokemonServices.fetchPokemonDetails(id);
    } catch (e) {
      _pokemon = null;
    }
    _isLoading = false;
    notifyListeners();
  }
}
