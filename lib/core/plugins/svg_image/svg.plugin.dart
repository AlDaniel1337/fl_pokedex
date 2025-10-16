import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgImage extends StatelessWidget {

  final String imageUrl;
  final double size;

  const SvgImage({
    super.key, 
    required this.imageUrl,
    this.size = 100
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      imageUrl,
      width: size,
      height: size,
      semanticsLabel: '',
      placeholderBuilder: (BuildContext context) => Container(
        padding: const EdgeInsets.all(30.0),
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
