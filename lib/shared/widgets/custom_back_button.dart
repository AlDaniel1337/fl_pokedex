import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {

  final Color color;

  const CustomBackButton({
    super.key, 
    this.color = Colors.white
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.of(context).pop(),
      icon: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: color,
      ),
    );
  }
}