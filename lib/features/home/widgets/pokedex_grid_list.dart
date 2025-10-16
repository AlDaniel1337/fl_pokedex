import 'package:fl_pokedex/features/home/widgets/pokedex_grid_list_item.dart';
import 'package:fl_pokedex/infrastructure/services/poke_api.service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

PokeApiService _pokeApiService = Get.put(PokeApiService());
class PokedexGridList extends StatelessWidget {
  const PokedexGridList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    
    _pokeApiService.get();

    return Positioned(
      top: 150,
      child: SizedBox(
        height: size.height - 160,
        width: size.width,
        child: Obx( () => Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.4,
                ), 
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: _pokeApiService.pokemons.length,
                itemBuilder: (context, index) {
                  return PokedexGridListItem( 
                    index: index,
                    imageSize: size.width * 0.25,
                    pokemon: _pokeApiService.pokemons[index]
                  );
                },
              ),
            ),
          ],
        ),
      )
    ));
  }
}
