import 'package:flutter/material.dart';
import 'feed_screen.dart';
import 'group_clan_screen.dart';
import 'user_profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('S.P.A.D.A - Início'),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const FeedScreen()),
                );
              },
              child: const Text('Acessar Feed'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const GroupClaScreen()),
                );
              },
              child: const Text('Ver Clã'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const UserProfileScreen()),
                );
              },
              child: const Text('Perfil do Usuário'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Reinicia a HomeScreen (pode ser usado como refresh)
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                );
              },
              child: const Text('Atualizar Início'),
            ),
          ],
        ),
      ),
    );
  }
}
