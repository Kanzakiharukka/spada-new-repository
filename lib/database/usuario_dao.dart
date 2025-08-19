import 'package:sqflite/sqflite.dart';
import 'database_helper.dart';

class Usuario {
  final int? id;
  final String nome;
  final String? nomeReal;
  final String? dataNascimento;
  final String? whatsapp;
  final String? clan;
  final String? fotoPath;
  final String email;
  final String password;

  Usuario({
    this.id,
    required this.nome,
    this.nomeReal,
    this.dataNascimento,
    this.whatsapp,
    this.clan,
    this.fotoPath,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'nome_real': nomeReal,
      'data_nascimento': dataNascimento,
      'whatsapp': whatsapp,
      'clan': clan,
      'foto_path': fotoPath,
      'email': email,
      'password': password,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'],
      nome: map['nome'],
      nomeReal: map['nome_real'],
      dataNascimento: map['data_nascimento'],
      whatsapp: map['whatsapp'],
      clan: map['clan'],
      fotoPath: map['foto_path'],
      email: map['email'],
      password: map['password'],
    );
  }
}

class UsuarioDao {
  final dbHelper = DatabaseHelper.instance;

  Future<int> insert(Usuario usuario) async {
    final db = await dbHelper.database;
    return await db.insert('usuarios', usuario.toMap());
  }

  Future<Usuario?> getUserByEmailAndPassword(String email, String password) async {
    final db = await dbHelper.database;
    final result = await db.query(
      'usuarios',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (result.isNotEmpty) {
      return Usuario.fromMap(result.first);
    }
    return null;
  }
}
