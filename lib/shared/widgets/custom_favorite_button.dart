import 'package:flutter/material.dart';

class CustomFavoriteButton extends StatelessWidget {

  final Color color;
  final bool isFavorite;
  final VoidCallback onPressed;

  const CustomFavoriteButton({
    super.key, 
    this.color = Colors.white,
    required this.isFavorite,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: color,
      ),
    );
  }
}