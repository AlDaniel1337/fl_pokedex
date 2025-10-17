import 'package:flutter/material.dart';
import 'package:fl_pokedex/shared/widgets/widgets.index.dart';
import 'widgets/widgets.dart';

class HomePage extends StatelessWidget {

  static const String route = "/HomePage";
   
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(   
      body: Stack(
        children: [
          Pokeball(),
          PokedexTitle(),
          PokedexGridList(),
          CustomSearchBar(),
          Positioned(
            top: 10, right: 20,
            child: ToggleThemeBtn()
          ),
        ],
      ),
    );
  }
}