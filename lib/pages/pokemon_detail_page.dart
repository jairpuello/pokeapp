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
      appBar: AppBar(
        title: const Text('Detalle'),
        elevation: 0,
        backgroundColor: Colors.lightBlue[50],
      ),
      backgroundColor: Colors.lightBlue[50],
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : pokemon == null
          ? const Center(child: Text('No se encontraron detalles'))
          : Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Hero(
                      tag: 'pokemon-${pokemon.id}',
                      child: Image.network(
                        pokemon.imageUrl,
                        height: 300,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(
                              Icons.error,
                              size: 120,
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 350,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 40, 20, 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 14,
                          color: const Color.fromARGB(
                            255,
                            129,
                            124,
                            124,
                          ).withOpacity(0.18),
                          offset: const Offset(0, -2),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            pokemon.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 14),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _Metric(label: 'ID', value: '#${pokemon.id}'),
                              _Metric(
                                label: 'Altura',
                                value:
                                    '${(pokemon.height / 10).toStringAsFixed(1)} m',
                              ),
                              _Metric(
                                label: 'Peso',
                                value:
                                    '${(pokemon.weight / 10).toStringAsFixed(1)} kg',
                              ),
                            ],
                          ),
                          const SizedBox(height: 22),
                          Divider(
                            height: 24,
                            thickness: 1,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Tipos',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 10,
                            runSpacing: 6,
                            children: pokemon.types
                                .map<Widget>((type) => Chip(label: Text(type)))
                                .toList(),
                          ),
                          if (pokemon.abilities.isNotEmpty) ...[
                            const SizedBox(height: 28),
                            const Text(
                              'Habilidades',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 10,
                              runSpacing: 6,
                              children: pokemon.abilities
                                  .map((a) => Chip(label: Text(a)))
                                  .toList(),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ],
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
