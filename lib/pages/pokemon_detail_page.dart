import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/providers/pokemon_providers.dart';

class PokemonDetailPage extends StatefulWidget {
  final int pokemonId;
  const PokemonDetailPage({super.key, required this.pokemonId});

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<PokemonDetailsProvider>(
        context,
        listen: false,
      ).fetchPokemonDetails(widget.pokemonId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PokemonDetailsProvider>(context);
    final pokemon = provider.pokemon;

    return Scaffold(
      appBar: AppBar(title: const Text('Detalle del Pokémon')),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : pokemon == null
          ? const Center(child: Text('No se encontraron detalles'))
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Image.network(
                      pokemon.imageUrl,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.error, size: 120),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Text(
                      pokemon.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'ID: ${pokemon.id}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Altura: ${pokemon.height}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Peso: ${pokemon.weight}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Tipos:',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 8,
                    children: pokemon.types
                        .map<Widget>(
                          (type) => Chip(
                            label: Text(
                              type,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
    );
  }
}
