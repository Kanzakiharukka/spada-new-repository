import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_options.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/auth_screen.dart';
import 'screens/home_screen.dart';
import 'screens/user_profile_screen.dart'; 
import 'screens/group_clan_screen.dart';
import 'screens/feed_screen.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const SpadaApp());
}

class SpadaApp extends StatelessWidget {
  const SpadaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'S.P.A.D.A',
      theme: ThemeData.dark(),
      initialRoute: '/',  // Inicializa direto na tela de splash
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/cadastro': (context) => const AuthScreen(),
        '/home': (context) => const HomeScreen(),
        '/perfil': (context) => const UserProfileScreen(),
        '/clan': (context) => const GroupClaScreen(),
        '/feed': (context) => const FeedScreen(),



      },
    );
  }
}
