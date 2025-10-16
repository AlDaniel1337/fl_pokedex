import 'package:fl_pokedex/features/pokemon_details/presentation/pokemon_Details.page.dart';
import 'package:flutter/material.dart';
import 'package:fl_pokedex/features/home/presentation/home.page.dart';

enum Routes {
  home  (url: HomePage.route, page: HomePage() ),
  pokemonDetails (url: PokemonDetailsPage.route, page: PokemonDetailsPage() );

  const Routes({ 
    required String url,
    required Widget page,
  }) : _url = url,
       _page = page;

  final String _url;
  String get url => _url;

  final Widget _page;
  Widget get page => _page;

}