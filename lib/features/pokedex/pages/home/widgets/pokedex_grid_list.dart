import 'package:fl_pokedex/features/pokedex/controller/pokedex.controller.dart';
import 'package:fl_pokedex/features/pokedex/pages/home/widgets/pokedex_grid_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

PokedexController _pokedexController = Get.put(PokedexController());
class PokedexGridList extends StatelessWidget {
  const PokedexGridList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Positioned(
      top: 150,
      child: SizedBox(
        height: size.height - 160,
        width: size.width,
        child: Obx( () => Column(
          children: [
            Expanded(
              child: GridView.builder(
                controller: _pokedexController.scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.4,
                ), 
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: _pokedexController.pokemons.length,
                itemBuilder: (context, index) {
                  return PokedexGridListItem( 
                    index: index,
                    imageSize: size.width * 0.25,
                    pokemon: _pokedexController.pokemons[index],
                    onTap: () => _pokedexController.showDetails(index),
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
