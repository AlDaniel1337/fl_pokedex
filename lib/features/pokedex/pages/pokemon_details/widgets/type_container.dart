import 'package:flutter/material.dart';

class TypeContainer extends StatelessWidget {
  
  final String typeName;
  final Widget child;
  final Color typeColor;

  const TypeContainer({
    super.key,
    required this.typeName,
    required this.child,
    this.typeColor = Colors.white,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: typeColor,
        borderRadius: const BorderRadius.all(Radius.circular(25.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
    
          Container(
            width: 35,
            height: 35,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: child,
          ),
    
          const SizedBox(width: 8.0),
          Text(
            typeName,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
