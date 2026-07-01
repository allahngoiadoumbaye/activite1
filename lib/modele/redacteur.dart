class Redacteur {
  final int? id;
  final String nom;
  final String prenom;
  final String email;
  // Constructeur de la classe Redacteur avec des paramètres nommés
  const Redacteur({
    this.id,
    required this.nom,
    required this.prenom,
    required this.email,
  });

  // Méthode pour convertir un objet Redacteur en Map<String, dynamic> pour SQLite
  Map<String, dynamic> toMap() {
    return {'id': id, 'nom': nom, 'prenom': prenom, 'email': email};
  }

  // Méthode pour créer un objet Redacteur à partir d'une Map<String, dynamic> provenant de SQLite
  factory Redacteur.fromMap(Map<String, dynamic> map) {
    return Redacteur(
      id: map['id'] as int?,
      nom: map['nom'] as String,
      prenom: map['prenom'] as String,
      email: map['email'] as String,
    );
  }
}
