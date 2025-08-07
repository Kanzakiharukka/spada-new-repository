import 'package:flutter/material.dart';

class GroupClaScreen extends StatelessWidget {
  const GroupClaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dados simulados — depois substituiremos por dados do Firestore
    final String nomeGrupo = 'Clã Dragão Carmesim';
    final String lider = 'Victor Kanzaki';
    final int membros = 7;
    final int pontuacao = 1520;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Clã / Grupo'),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Informações do Clã',
              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            infoTile('Nome do Clã', nomeGrupo),
            infoTile('Líder', lider),
            infoTile('Membros', membros.toString()),
            infoTile('Pontuação', pontuacao.toString()),
            const SizedBox(height: 40),
            const Center(
              child: Text(
                'Funcionalidades como criar, sair ou entrar em clãs serão adicionadas futuramente.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget infoTile(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(color: Colors.grey, fontSize: 18),
          ),
          Text(
            value,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
