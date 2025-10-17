import 'package:fl_pokedex/domain/entities/pokemon.entity.dart';
import 'package:flutter/material.dart';

class StatsList extends StatelessWidget {

  final List<Stats> stats;
  final Size size;
   
  const StatsList({
    super.key,
    required this.stats,
    required this.size,
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...stats.map((stat) => 
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: PokemonStatRow(
              statName: stat.name, 
              statValue: stat.value.toDouble(), 
              barValue: size.width * 0.6
            ),
          )
        ),
      ]
    );
  }
}


class PokemonStatRow extends StatelessWidget {

  final String statName;
  final double statValue;
  final double barValue;

  const PokemonStatRow({
    super.key,
    required this.statName,
    required this.statValue,
    required this.barValue,
  });


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        SizedBox(
          width: 80,
          child: Text(statName, 
            style: const TextStyle(
              fontSize: 16
            )
          ),
        ),

        Text( statValue.toString(), 
          style: const TextStyle(
            fontWeight: FontWeight.bold, 
            fontSize: 16
          )
        ),

        SizedBox(
          width: barValue,
          child: LinearProgressIndicator(
            value: statValue / 100,
            backgroundColor: Colors.grey[300],
            color: (statValue / 100 >= 0.5) ?Colors.green : Colors.red,
            minHeight: 4,
            semanticsLabel: statName,
          ),
        ),
      ],
    );
  }
}