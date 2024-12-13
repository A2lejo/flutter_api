import 'dart:convert';
import '../models/pokemon.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://pokeapi.co/api/v2/pokemon/';

  Future<Pokemon> fetchPokemon(String name) async {
    final response = await http.get(Uri.parse('$baseUrl$name'));

    if (response.statusCode == 200) {
      return Pokemon.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Pokémon');
    }
  }
}