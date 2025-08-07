import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do Usuário'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Sair',
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacementNamed('/login');
            },
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.person, size: 100, color: Colors.white),
              const SizedBox(height: 20),
              Text(
                'Email: ${user?.email ?? 'desconhecido'}',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 20),
              const Text(
                'XP: 0',
                style: TextStyle(color: Colors.greenAccent, fontSize: 20),
              ),
              const SizedBox(height: 10),
              const Text(
                'Nível: 1',
                style: TextStyle(color: Colors.amber, fontSize: 20),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pop(); // Volta para tela anterior (ex: Home)
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Voltar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
