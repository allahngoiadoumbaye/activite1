import 'package:flutter/material.dart';
import '../modele/redacteur.dart';
import '../services/database_manager.dart';

class RedacteurInterface extends StatefulWidget {
  const RedacteurInterface({super.key});

  @override
  State<RedacteurInterface> createState() => _RedacteurInterfaceState();
}

class _RedacteurInterfaceState extends State<RedacteurInterface> {
  final DatabaseManager dbManager = DatabaseManager.instance;
  List<Redacteur> redacteurs = [];

  @override
  void initState() {
    super.initState();
    _loadRedacteurs();
  }

  Future<void> _loadRedacteurs() async {
    final data = await dbManager.getAllRedacteurs();
    setState(() {
      redacteurs = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gestion des Rédacteurs')),
      body: ListView.builder(
        itemCount: redacteurs.length,
        itemBuilder: (context, index) {
          final redacteur = redacteurs[index];
          return ListTile(
            title: Text('${redacteur.prenom} ${redacteur.nom}'),
            subtitle: Text(redacteur.email),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                await dbManager.deleteRedacteur(redacteur.id!);
                await _loadRedacteurs(); // Recharger la liste après suppression
              },
            ),
          );
        },
      ),
    );
  }
}
