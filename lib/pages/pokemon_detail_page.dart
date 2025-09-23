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
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Image.network(
                          pokemon.imageUrl,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.error, size: 120),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    pokemon.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Divider(
                    height: 24,
                    thickness: 1,
                    color: Colors.grey.shade300,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _Metric(label: 'ID', value: '#${pokemon.id}'),
                      _Metric(
                        label: 'Altura',
                        value: '${(pokemon.height / 10).toStringAsFixed(1)} m',
                      ),
                      _Metric(
                        label: 'Peso',
                        value: '${(pokemon.weight / 10).toStringAsFixed(1)} kg',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Divider(
                    height: 24,
                    thickness: 1,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Tipos',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    runSpacing: 6,
                    children: pokemon.types
                        .map<Widget>((type) => Chip(label: Text(type)))
                        .toList(),
                  ),
                ],
              ),
            ),
    );
  }
}

class _Metric extends StatelessWidget {
  final String label;
  final String value;
  const _Metric({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: Colors.grey.shade700)),
      ],
    );
  }
}
