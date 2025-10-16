import 'package:fl_pokedex/core/navigation/navigation.dart';
import 'package:fl_pokedex/core/navigation/routes.enum.dart';
import 'package:fl_pokedex/domain/entities/pokemon.entity.dart';
import 'package:fl_pokedex/infrastructure/services/poke_api.service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// PokedexController _pokedexController = Get.put(PokedexController());
/// PokedexController pokedexController = Get.put(PokedexController());

class PokedexController extends GetxController{

  final PokeApiService _pokeApiService = PokeApiService();

  var selectedPokemonindex = 0.obs;

  final ScrollController scrollController = ScrollController();
  var isLoading = false.obs;

  RxList<Pokemon> pokemons = <Pokemon>[].obs;

  @override
  void onInit() {
    super.onInit();
    determineScrollPositionAction();
    getPokemons();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  // --- Lógica de Carga Inicial ---
  void getPokemons() async {
    if(pokemons.isNotEmpty) return;
    final initialPokemons = await _pokeApiService.getPokemons();
    pokemons.assignAll(initialPokemons);
  }

  void showDetails(int index) {
    selectedPokemonindex.value = index;
    Navigation.goToPage(page: Routes.pokemonDetails);
  }

  // +++ Lógica de Scroll Infinito +++

  void loadNextPage() async {
    if(isLoading.value) return;
    isLoading.value = true;
    await Future.delayed( const Duration( seconds: 2) );

    final newPokemons = await _pokeApiService.getPokemons(
      // Usar .length para obtener el offset actual (GetX maneja .length como .value.length)
      offset: pokemons.length,
      limit: 20,
    );

    pokemons.addAll(newPokemons);
    
    isLoading.value = false;
  }


  void determineScrollPositionAction(){
    scrollController.addListener((){
      if( ( scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent ){
        loadNextPage();
      }
    });
  }
}