import 'package:flutter/material.dart';

void main() {
  runApp(const MonAppli());
}

// Classe principale de l'application
class MonAppli extends StatelessWidget {
  const MonAppli({super.key});
  // Construction de l'interface utilisateur de l'application
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Magazine',
      debugShowCheckedModeBanner: false,
      home: PageAccueil(),
    );
  }
}

// Page d'accueil de l'application
class PageAccueil extends StatelessWidget {
  const PageAccueil({super.key});
  // Construction de l'interface utilisateur de la page d'accueil
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Magazine Infos',
          style: TextStyle(color: Colors.white),
        ),

        // Centrer le titre de l'AppBar
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            print('Menu cliqué');
          },
        ),

        // Ajouter une action de recherche dans l'AppBar
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              print('Recherche cliquée');
            },
          ),
        ],
      ),
      // Afficher une image centrée dans le corps de la page d'accueil
      body: Center(
        child: Image.asset(
          'assets/images/MagazineInfo.png',
          fit: BoxFit.contain,
        ),
      ),
      // Ajouter un bouton flottant en bas à droite de la page d'accueil
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          print('Tu as cliqué dessus');
        },
        child: const Text('Click'),
      ),
    );
  }
}
