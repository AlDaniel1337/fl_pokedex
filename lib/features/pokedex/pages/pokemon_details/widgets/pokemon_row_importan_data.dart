import 'package:flutter/material.dart';

class PokemonRowImportanData extends StatelessWidget {
  final List<Widget> children;

  const PokemonRowImportanData({
    super.key,
    required this.children,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [ ...children ],
        ),
        const SizedBox(height: 10),
      ],
      
    );
  }
}

