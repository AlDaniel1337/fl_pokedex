import 'package:fl_pokedex/features/features_pages.index.dart';
import 'package:flutter/material.dart';

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