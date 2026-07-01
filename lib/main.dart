import 'package:flutter/material.dart';
import 'views/redacteur_interface.dart'; // Import de la vue que tu vas créer

void main() {
  runApp(const MonAppliRedacteurs());
}

class MonAppliRedacteurs extends StatelessWidget {
  const MonAppliRedacteurs({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion des Rédacteurs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Couleur rose/violette comme sur les captures du TP
        primarySwatch: Colors.pink,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      home:
          const RedacteurInterface(), // On lance directement l'interface de gestion
    );
  }
}
