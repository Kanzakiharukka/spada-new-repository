

class LocalDB {
  static Database? _database;

  // Inicializa o banco
  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('spada_app.db');
    return _database!;
  }

  static Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            email TEXT UNIQUE,
            password TEXT,
            name TEXT,
            clanName TEXT,
            birthDate TEXT,
            whatsapp TEXT,
            photoPath TEXT
          )
        ''');
      },
    );
  }

  // ================= CRUD =================

  // Inserir novo usuário
  static Future<int> insertUser(Map<String, dynamic> user) async {
    final db = await database;
    return await db.insert('users', user,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Buscar usuário por email e senha
  static Future<Map<String, dynamic>?> getUser(
      String email, String password) async {
    final db = await database;
    final res = await db.query('users',
        where: 'email = ? AND password = ?', whereArgs: [email, password]);
    if (res.isNotEmpty) return res.first;
    return null;
  }

  // Listar todos os usuários
  static Future<List<Map<String, dynamic>>> getAllUsers() async {
    final db = await database;
    return await db.query('users');
  }

  // Atualizar usuário
  static Future<int> updateUser(int id, Map<String, dynamic> novosDados) async {
    final db = await database;
    return await db.update(
      'users',
      novosDados,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Deletar usuário
  static Future<int> deleteUser(int id) async {
    final db = await database;
    return await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
