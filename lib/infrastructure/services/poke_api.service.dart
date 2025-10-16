import 'package:fl_pokedex/core/plugins/http/dio.plugin.dart';
import 'package:fl_pokedex/domain/entities/pokemon.entity.dart';
import 'package:fl_pokedex/infrastructure/mappers/pokemon_model_to_entity.dart';
import 'package:fl_pokedex/infrastructure/models/pokeapi_pokemon_response.dart';
import 'package:fl_pokedex/infrastructure/models/pokeapi_pokemons_response.dart';

class PokeApiService{
   
  final String _baseUrl = 'https://pokeapi.co/api/v2/';
  late DioPlugin _dioPlugin;

  PokeApiService(){
    _dioPlugin = DioPlugin(_baseUrl);
  }   

  final List<Pokemon> _pokemons = [];
  Future<List<Pokemon>> getPokemons({int limit = 20, int offset = 0}) async {

    _pokemons.clear();

    // 1. Obtener datos de la API principal
    final pokemonsResponse = await _dioPlugin.getResponse('pokemon?limit=$limit&offset=$offset');
    
    // 2. Pasar datos a un modelo
    PokeapiPokemonsResponse model = PokeapiPokemonsResponse.fromJson(pokemonsResponse);

    // 3. Crear una lista de Futures para las llamadas a los detalles
    final List<Future<Pokemon>> detailFutures = model.results!.map((pokemon) async {
      // Await es necesario aquí para obtener el detalle ANTES de mapear al modelo/entidad
      final detail = await _dioPlugin.getResponse('pokemon/${pokemon.name}');
      
      // Pasar detalles a un modelo
      final PokeapiPokemonResponse detailModel = PokeapiPokemonResponse.fromJson(detail);
      
      // Pasar detalles a una entidad y devolver el Future<Pokemon>
      return PokemonModelToEntity.fromModel(detailModel);
    }).toList();

    // 4. Esperar a que TODOS los Futures de detalle se completen
    final List<Pokemon> detailedPokemons = await Future.wait(detailFutures);

    // 5. Agregar la lista completa a _pokemons
    _pokemons.addAll(detailedPokemons);
    
    return _pokemons;
  }
  
}