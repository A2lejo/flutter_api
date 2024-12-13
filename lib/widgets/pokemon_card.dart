// lib/widgets/pokemon_card.dart
import 'package:flutter/material.dart';
import '../models/pokemon.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(pokemon.imageUrl),
          Text(pokemon.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text('Abilities:\n ${pokemon.abilities.join(', ')}'),
        ],
      ),
    );
  }
}