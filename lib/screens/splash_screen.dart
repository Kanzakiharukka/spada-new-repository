import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           // Brasão envolvendo logo e título
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                border: Border.all(color: Color(0xFFFFD700), width: 3),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFFFD700).withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 8,
                  ),
                ],
              ),

              child: Column(
                children: [
            // Logo do SPADA
            Image.asset(
              'assets/images/espadas-PNG.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 16),

            // Nome do grupo
            const Text(
              'S.P.A.D.A',
              style: TextStyle(
                color: Color(0xFFFFD700), // Dourado
                fontSize: 28,
                fontFamily: 'Garamond',
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Botão Login
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFFFFD700), width: 2),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Color(0xFFFFD700),
                  fontSize: 18,
                  fontFamily: 'Garamond',
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Botão Cadastro
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cadastro');
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFFFFD700), width: 2),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              ),
              child: const Text(
                'Cadastro',
                style: TextStyle(
                  color: Color(0xFFFFD700),
                  fontSize: 18,
                  fontFamily: 'Garamond',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}