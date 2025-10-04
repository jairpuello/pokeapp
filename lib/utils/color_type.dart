import 'package:flutter/material.dart';

Color typeColor(String type) {
  switch (type.toLowerCase()) {
    case 'fire':
      return Colors.deepOrangeAccent;
    case 'water':
      return Colors.blueAccent;
    case 'grass':
      return Colors.green.shade600;
    case 'electric':
      return Colors.amber.shade700;
    case 'ice':
      return Colors.cyan.shade400;
    case 'fighting':
      return Colors.red.shade700;
    case 'poison':
      return Colors.purple;
    case 'ground':
      return Colors.brown;
    case 'flying':
      return Colors.indigo.shade300;
    case 'psychic':
      return Colors.pinkAccent;
    case 'bug':
      return Colors.lightGreen.shade700;
    case 'rock':
      return Colors.brown.shade400;
    case 'ghost':
      return Colors.deepPurple;
    case 'dragon':
      return Colors.indigo;
    case 'dark':
      return Colors.blueGrey.shade700;
    case 'steel':
      return Colors.blueGrey;
    case 'fairy':
      return Colors.pink.shade300;
    default:
      return Colors.teal;
  }
}
