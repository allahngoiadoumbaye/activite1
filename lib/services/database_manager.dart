// Ce fichier gère la base de données SQLite pour l'application Flutter
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart';
import '../modele/redacteur.dart'; // Importation de ton modèle

class DatabaseManager {
  // Instance unique (Singleton) pour éviter d'ouvrir plusieurs bases en même temps
  static final DatabaseManager instance = DatabaseManager._init();
  static sqflite.Database? _database;

  DatabaseManager._init();

  // Permet de récupérer la base de données ou de l'initialiser si c'est la première fois
  Future<sqflite.Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('magazine_infos.db');
    return _database!;
  }

  // Initialisation et ouverture de la base SQLite sur le téléphone
  Future<sqflite.Database> _initDB(String filePath) async {
    final dbPath = await sqflite.getDatabasesPath();
    final path = join(dbPath, filePath);

    return await sqflite.openDatabase(
      path,
      version: 1,
      onCreate: _createDB, // Appelé uniquement à la toute première installation
    );
  }

  // Création de la table 'redacteurs' avec ses colonnes
  Future<void> _createDB(sqflite.Database db, int version) async {
    await db.execute('''
      CREATE TABLE redacteurs (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nom TEXT NOT NULL,
        prenom TEXT NOT NULL,
        email TEXT NOT NULL
      )
    ''');
  }

  //  Insérer un nouveau rédacteur
  Future<int> insertRedacteur(Redacteur redacteur) async {
    final db = await instance.database;
    // On convertit l'objet Redacteur en Map pour SQLite
    return await db.insert('redacteurs', redacteur.toMap());
  }

  // Récupérer la liste complète des rédacteurs
  Future<List<Redacteur>> getAllRedacteurs() async {
    final db = await instance.database;
    // On récupère toutes les lignes de la table sous forme de List<Map>
    final result = await db.query('redacteurs');

    // On transforme chaque ligne Map en un véritable objet Redacteur grâce à fromMap
    return result.map((json) => Redacteur.fromMap(json)).toList();
  }

  // Modifier les informations d'un rédacteur
  Future<int> updateRedacteur(Redacteur redacteur) async {
    final db = await instance.database;
    return await db.update(
      'redacteurs',
      redacteur.toMap(),
      where: 'id = ?',
      whereArgs: [redacteur.id],
    );
  }

  // Supprimer un rédacteur de la base
  Future<int> deleteRedacteur(int id) async {
    final db = await instance.database;
    return await db.delete('redacteurs', where: 'id = ?', whereArgs: [id]);
  }
}
