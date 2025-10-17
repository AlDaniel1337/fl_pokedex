import 'package:flutter/material.dart';

class AbilitiesList extends StatelessWidget {

  final List<String> data;
  final String title;
   
  const AbilitiesList({
    super.key,
    required this.data,
    required this.title,
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...data.isNotEmpty ? [
          const SizedBox(height: 20),
          Text(title, 
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            )
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: data.map((ability) => Chip(
              label: Text(ability[0].toUpperCase() + ability.substring(1)),
              backgroundColor: Colors.white10,
            )).toList(),
          ),
        ] : [],
      ]
    );
  }
}