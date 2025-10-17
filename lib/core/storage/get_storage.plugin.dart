import 'package:fl_pokedex/domain/entities/pokemon.entity.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// FavoritesController _favoritesController = Get.put(FavoritesController());
// FavoritesController favoritesController = Get.put(FavoritesController());

class FavoritesController extends GetxController {
  final _box = GetStorage();
  final String _key = 'favorite_pokemon_ids';

  RxList<int> favoriteIds = <int>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Carga los IDs favoritos guardados al iniciar
    List<dynamic> storedIds = _box.read<List<dynamic>>(_key) ?? [];
    favoriteIds.assignAll(storedIds.map((e) => e as int));
  }

  // Comprueba si un Pokémon es favorito
  bool isFavorite(int pokemonId) => favoriteIds.contains(pokemonId);
  
  void toggleFavorite(Pokemon pokemon) {
    if (isFavorite(pokemon.id)) {
      favoriteIds.remove(pokemon.id);
    } else {
      favoriteIds.add(pokemon.id);
    }
    _saveFavorites(); 
  }

  // Guarda la lista actualizada en GetStorage
  void _saveFavorites() {
    _box.write(_key, favoriteIds.toList());
  }
}