import 'package:flutter/material.dart';

class PokemonDetailsPage extends StatelessWidget {

  static const String route = "/PokemonDetailsPage";
   
  const PokemonDetailsPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      appBar: AppBar(
         title: const Text('PokemonDetailsPage'),
         centerTitle: true,
      ),
   
      body: const Center(
         child: Text('PokemonDetailsPage'),
      ),
    );
  }
}