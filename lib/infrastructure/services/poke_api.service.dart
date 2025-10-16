import 'package:fl_pokedex/core/plugins/http/dio.plugin.dart';
import 'package:fl_pokedex/infrastructure/mappers/pokemon_model_to_entity.dart';
import 'package:fl_pokedex/infrastructure/models/pokeapi_pokemon_response.dart';
import 'package:fl_pokedex/infrastructure/models/pokeapi_pokemons_response.dart';

import 'package:get/get.dart';

/// PokeApiService _pokeApiService = Get.put(PokeApiService());

class PokeApiService extends GetxController{
   
  final String _baseUrl = 'https://pokeapi.co/api/v2/';
  late DioPlugin _dioPlugin;

  PokeApiService(){
    _dioPlugin = DioPlugin(_baseUrl);
  }   

  var pokemons = [].obs;
  
  get() async {

    if(pokemons.isNotEmpty) return;

    pokemons.clear();
    // Obtener datos de la API
    final pokemonsResponse = await _dioPlugin.getResponse('pokemon?limit=10&offset=0');

    // Pasar datos a un modelo
    PokeapiPokemonsResponse model = PokeapiPokemonsResponse.fromJson(pokemonsResponse);

    // Obtener detalles de un pokemon
    model.results?.map( (pokemon) async {
      final detail = await _dioPlugin.getResponse('pokemon/${pokemon.name}');
      // Pasar detalles a un modelo
      final PokeapiPokemonResponse detailModel = PokeapiPokemonResponse.fromJson(detail);
      // Pasar detalles a una entidad
      final pokemonEntity = PokemonModelToEntity.fromModel(detailModel);
      pokemons.add( pokemonEntity );
    }).toList();
  }
  
}