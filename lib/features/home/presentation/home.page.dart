import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  static const String route = "/HomePage";
   
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      appBar: AppBar(
         title: const Text('HomePage'),
         centerTitle: true,
      ),
   
      body: const Center(
         child: Text('HomePage'),
      ),
    );
  }
}