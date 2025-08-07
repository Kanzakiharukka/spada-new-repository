import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home S.P.A.D.A'),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bem-vindo!',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(height: 20),

            // Botão para ir ao perfil
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamed('/perfil');
              },
              icon: const Icon(Icons.person),
              label: const Text('Ver Perfil'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
