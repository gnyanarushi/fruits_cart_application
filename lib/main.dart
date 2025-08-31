import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruits_cart/bloc-practice/features/Auth/fruits_auth.dart';
import 'package:fruits_cart/bloc-practice/features/splash/ui/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home':
            (context) =>
                const FruitsAuth(),
        // Replace '/home' with your actual home screen widget
      },
    );
  }
}
