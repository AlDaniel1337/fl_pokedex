import 'package:fl_pokedex/shared/widgets/widgets.index.dart';
import 'package:flutter/material.dart';


class RowButtons extends StatelessWidget {
  
  final VoidCallback onFavoritePressed;

  const RowButtons({
    super.key,
    required this.onFavoritePressed,
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
            isFavorite: false,
            onPressed: onFavoritePressed,
          ),
        ],
      ),
    );
  }
}