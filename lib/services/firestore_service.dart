import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // CREATE: Criar novo usuário no Firestore
  Future<void> criarUsuarioFirestore(User user, String nome) async {
    final usuarioRef = _db.collection('users').doc(user.uid);

    final dados = {
      'nome': nome,
      'email': user.email,
      'nivel': 'iniciante',
      'criadoEm': FieldValue.serverTimestamp(),
    };

    await usuarioRef.set(dados);
  }

  // READ: Buscar dados do usuário
  Future<DocumentSnapshot<Map<String, dynamic>>> buscarUsuario(String uid) async {
    return await _db.collection('users').doc(uid).get();
  }

  // UPDATE: Atualizar dados do usuário
  Future<void> atualizarUsuario(String uid, Map<String, dynamic> novosDados) async {
    await _db.collection('users').doc(uid).update(novosDados);
  }

  // DELETE: Excluir usuário
  Future<void> deletarUsuario(String uid) async {
    await _db.collection('users').doc(uid).delete();
  }

  // LISTAR: Todos os usuários (em tempo real)
  Stream<QuerySnapshot<Map<String, dynamic>>> listarUsuarios() {
    return _db.collection('users').snapshots();
  }
}
