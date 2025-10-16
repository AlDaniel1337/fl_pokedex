import 'package:fl_pokedex/infrastructure/services/poke_api.service.dart';
import 'package:fl_pokedex/shared/widgets/widgets.index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './widgets/widgets.index.dart';

PokeApiService _pokeApiService = Get.put(PokeApiService());
class PokemonDetailsPage extends StatelessWidget {

  static const String route = "/PokemonDetailsPage";
   
  const PokemonDetailsPage({super.key});
  
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    final selectedPokemon = _pokeApiService.pokemons[0];

    return Scaffold(

      body: Stack(
        children: [

          Positioned(
            top: 0, left: 0, right: 0,
            child: UContainer(
              size: size,
              child: const Center(
                child: PokeballBackgroundImage(),
              ),
            ),
          ),

          Positioned(
            top: 150, left: (size.width / 2) - 100,
            child: Image.network(
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
              width: 200,
              height: 200,
            ),
          ),

      
          Positioned(
            top: 40, left: 0, right: 0,
            child: RowButtons(
              onFavoritePressed: () {},
            ),
          ),

          Positioned(
            top: 430, left: 20,
            child: Center(
              child: Text(
                selectedPokemon.name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Positioned(
            top: 480, left: 20,
            child: Center(
              child: Text(
                '#1',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),

          Positioned(
            top: 530,
            child: Container(
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              decoration: const BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                    width: 35,
                    height: 35,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.local_fire_department,
                      color: Colors.orangeAccent,
                    ),
                  ),

                  const SizedBox(width: 8.0),
                  const Text(
                    'Fire',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          )

    

        ],
      ),
    );
  }
}
