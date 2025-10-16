import 'package:fl_pokedex/shared/widgets/widgets.index.dart';
import 'package:flutter/material.dart';

class UContainer extends StatelessWidget {

  final Size size;
  final Widget child;
   
  const UContainer({
    super.key,
    required this.size,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return  ClipPath(
      clipper: BottomCurvedClipper(),
      child: Container(
        width: size.width,
        height: 400,
        color: Colors.deepPurple,
        child: child,
      ),
    );
  }
}