import 'package:flutter/material.dart';
import '../models/pokemon.dart';
import '../models/coffee.dart';
import '../services/api_services.dart';
import '../services/coffee_services.dart';
import '../widgets/pokemon_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  final ApiService _apiService = ApiService();
  final CoffeeService _coffeeService = CoffeeService();
  Pokemon? _pokemon;
  Coffee? _coffee;
  bool _isLoading = false;

  void _searchPokemon() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final pokemon =
          await _apiService.fetchPokemon(_controller.text.toLowerCase());
      setState(() {
        _pokemon = pokemon;
      });
    } catch (e) {
      // Handle error
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _fetchRandomCoffeeImage() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final coffee = await _coffeeService.fetchRandomCoffeeImage();
      setState(() {
        _coffee = coffee;
      });
    } catch (e) {
      // Handle error
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemons & Coffee'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Nombre del pokémon',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _searchPokemon,
                ),
              ),
            ),
            SizedBox(height: 20),
            _isLoading
                ? CircularProgressIndicator()
                : _pokemon != null
                    ? PokemonCard(pokemon: _pokemon!)
                    : Container(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchRandomCoffeeImage,
              child: Text('Un café por favor'),
            ),
            SizedBox(height: 20),
            _coffee != null       ? SizedBox(
                    width: 200, // Ancho deseado
                    height: 200, // Alto deseado
                    child: Image.network(_coffee!.imageUrl),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
