import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de posts simulados
    final List<Map<String, String>> posts = [
      {
        'autor': 'Capitão Varek',
        'conteudo': 'Missão concluída com honra! O Clã da Lua venceu a Arena!',
        'data': '06/08/2025',
      },
      {
        'autor': 'Lady Elira',
        'conteudo': 'Treinamento geral neste sábado no Parque Central às 15h!',
        'data': '05/08/2025',
      },
      {
        'autor': 'Mestre Kanzaki',
        'conteudo': 'Parabéns a todos os novos iniciados do S.P.A.D.A!',
        'data': '04/08/2025',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed do S.P.A.D.A'),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return Card(
            color: Colors.grey[900],
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post['autor'] ?? '',
                    style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    post['conteudo'] ?? '',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      post['data'] ?? '',
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
