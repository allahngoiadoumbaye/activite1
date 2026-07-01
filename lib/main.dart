import 'package:flutter/material.dart';
import 'views/redacteur_interface.dart';

//fonction principale qui lance l'application Flutter
void main() {
  runApp(const MonAppliRedacteurs());
}

// Classe principale de l'application Flutter
class MonAppliRedacteurs extends StatelessWidget {
  const MonAppliRedacteurs({super.key});

  // Méthode qui construit l'interface utilisateur de l'application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion des Rédacteurs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      // Définition de l'écran d'accueil de l'application
      home: const RedacteurInterface(),
    );
  }
}
