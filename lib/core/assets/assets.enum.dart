enum Assets {
  pokeballBackground(imageUrl: 'assets/pokeball.png');

  const Assets({ 
    required String imageUrl,
  }) : _imageUrl = imageUrl;

  final String _imageUrl;
  String get imageUrl => _imageUrl;

}