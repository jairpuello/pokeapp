import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/providers/pokemon_providers.dart';
import 'package:test_flutter/pages/pokemon_detail_page.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({super.key});

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<PokemonProvider>(context, listen: false).fetchPokemons();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PokemonProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: Icon(Icons.catching_pokemon, color: Colors.white),
        title: const Text(
          'Lista de pokemones',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : provider.pokemons.isEmpty
          ? const Center(child: Text('No hay Pokémon disponibles'))
          : GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 4,
              ),
              itemCount: provider.pokemons.length,
              itemBuilder: (context, index) {
                final pokemon = provider.pokemons[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            PokemonDetailPage(pokemonId: pokemon.id),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        pokemon.imageUrl,
                        height: 80,
                        width: 80,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        pokemon.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
