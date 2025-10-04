import 'package:flutter/material.dart';
import 'package:test_flutter/pages/pokemon_page.dart';
import 'package:test_flutter/pages/search_pokemon_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = [PokemonPage(), SearchPokemonPage()];
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Pokemones'),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar Pokemon',
          ),
        ],
      ),
    );
  }
}
