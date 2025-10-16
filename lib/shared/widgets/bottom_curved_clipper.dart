import 'package:flutter/material.dart';

class BottomCurvedClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    final path = Path();

    // 1. Inicia en la esquina superior izquierda (0, 0)
    path.lineTo(0, 0);

    // 2. Traza la línea superior hasta la esquina superior derecha (size.width, 0)
    path.lineTo(size.width, 0);

    // 3. Traza la línea derecha hasta el punto antes de la curva (size.width, size.height - curveHeight)
      // Usaremos un porcentaje o un valor fijo para la altura de la curva.
    double curveHeight = size.height * 0.25; // Altura de la curva

    path.lineTo(size.width, size.height - curveHeight);

    //* 4. Crea la curva 'U' en la parte inferior
    
    // Punto de control para la curva
      // En el centro inferior, un poco más abajo para el efecto 'U'
    final controlPoint = Offset(size.width / 2, size.height + curveHeight * 0.5); // Ajuste para la forma 'U'

    // Punto final de la curva (en la parte izquierda)
    final endPoint = Offset(0, size.height - curveHeight);

    // Usa una curva cuadrática para el efecto redondeado ('U' suave)
    path.quadraticBezierTo(
      controlPoint.dx,
      controlPoint.dy,
      endPoint.dx,
      endPoint.dy,
    );

    // 5. Cierra el camino (línea izquierda que ya fue parcialmente trazada)
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
  
}