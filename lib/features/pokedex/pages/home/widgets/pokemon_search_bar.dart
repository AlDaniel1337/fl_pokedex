import 'package:flutter/material.dart';


class PokemonSearchBar extends StatefulWidget {
  final void Function(String query) onSearch;
  final VoidCallback onClear;
  
  const PokemonSearchBar({
    super.key,
    required this.onSearch,
    required this.onClear,
  });

  @override
  PokemonSearchBarState createState() => PokemonSearchBarState();
}

class PokemonSearchBarState extends State<PokemonSearchBar> {
  
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _handleSearch() {
    final query = _searchController.text.trim();
    if (query.isNotEmpty) {
      widget.onSearch(query.toLowerCase());
      // Ocultar el teclado
      FocusScope.of(context).unfocus(); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          _searchSpace(),
          const SizedBox(width: 8.0),
          _searchBtn(),
        ],
      ),
    );
  }

  Expanded _searchSpace() {
    return Expanded(
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Buscar Pokémon por nombre o ID',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),

          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _searchController.clear();
              widget.onClear();
            },
          ),
          
        ),
        onChanged: (value) {
          if (value.isEmpty) widget.onClear();
        },
        onSubmitted: (_) => _handleSearch(),
      ),
    );
  }

  SizedBox _searchBtn() {
    return SizedBox(
      height: 55,
      child: ElevatedButton(
        onPressed: _handleSearch,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15),
        ),
        child: const Icon(Icons.search),
      ),
    );
  }
}