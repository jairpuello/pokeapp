import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/pages/home_page.dart';
import 'package:test_flutter/pages/pokemon_page.dart';
import 'package:test_flutter/providers/pokemon_providers.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => PokemonProvider()),
      ChangeNotifierProvider(create: (_) => PokemonDetailsProvider()),
    ],
    child: const MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}
