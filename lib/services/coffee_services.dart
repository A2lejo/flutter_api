// lib/services/coffee_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/coffee.dart';

class CoffeeService {
  static const String baseUrl = 'https://coffee.alexflipnote.dev/random.json';

  Future<Coffee> fetchRandomCoffeeImage() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return Coffee.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load coffee image');
    }
  }
}