import 'package:flutter/material.dart';
import 'package:test_flutter/widgets/textformfield_widget.dart';

class SearchPokemonPage extends StatelessWidget {
  const SearchPokemonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buscar Pokémon')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  TextFormFieldWidget(
                    hintText: 'ID del Pokémon',
                    labelText: 'Buscar Pokémon',
                    icon: Icons.catching_pokemon,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Lógica de búsqueda aquí
                    },
                    child: Text('Buscar'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
