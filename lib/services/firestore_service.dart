import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

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
}
