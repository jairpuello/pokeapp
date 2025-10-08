import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/pages/pokemon_detail_page.dart';
import 'package:test_flutter/providers/pokemon_providers.dart';
import 'package:test_flutter/widgets/textformfield_widget.dart';
import 'package:flutter/services.dart';

class SearchPokemonPage extends StatefulWidget {
  const SearchPokemonPage({super.key});

  @override
  State<SearchPokemonPage> createState() => _SearchPokemonPageState();
}

class _SearchPokemonPageState extends State<SearchPokemonPage> {
  final _formKeytext = GlobalKey<FormState>();
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _searchPokemon() async {
    if (!_formKeytext.currentState!.validate()) return;
    final id = int.parse(_searchController.text.trim());
    final detailsProv = context.read<PokemonDetailsProvider>();

    await detailsProv.fetchPokemonDetails(id);
    if (!mounted) return;
    if (detailsProv.pokemon == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No se encontró el Pokémon con ID $id')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => PokemonDetailPage(pokemonId: id)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buscar Pokémon')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKeytext,
          child: Column(
            children: [
              TextFormFieldWidget(
                controller: _searchController,
                hintText: 'ID del Pokémon',
                labelText: 'Buscar Pokémon',
                icon: Icons.catching_pokemon,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _searchPokemon,
                child: const Text('Buscar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
