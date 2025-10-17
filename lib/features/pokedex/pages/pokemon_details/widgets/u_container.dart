import 'package:fl_pokedex/shared/widgets/widgets.index.dart';
import 'package:flutter/material.dart';

class UContainer extends StatelessWidget {

  final Size size;
  final Widget child;
  final Color color;
   
  const UContainer({
    super.key,
    required this.size,
    required this.child,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return  ClipPath(
      clipper: BottomCurvedClipper(),
      child: Container(
        width: size.width,
        height: 400,
        color: color,
        child: child,
      ),
    );
  }
}