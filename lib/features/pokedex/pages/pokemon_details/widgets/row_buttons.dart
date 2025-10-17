import 'package:fl_pokedex/shared/widgets/widgets.index.dart';
import 'package:flutter/material.dart';


class RowButtons extends StatelessWidget {
  
  final VoidCallback onFavoritePressed;
  final bool isFavorite;

  const RowButtons({
    super.key,
    required this.onFavoritePressed,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomBackButton(),
          CustomFavoriteButton(
            isFavorite: isFavorite,
            onPressed: onFavoritePressed,
          ),
        ],
      ),
    );
  }
}