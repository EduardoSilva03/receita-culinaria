import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Certifique-se de que esse arquivo está corretamente configurado
import 'screens/home_screen.dart';

void main() async {
  // Certifique-se de chamar WidgetsFlutterBinding.ensureInitialized() para garantir que os widgets do Flutter sejam inicializados antes de iniciar o Firebase.
  WidgetsFlutterBinding.ensureInitialized();

  // Inicialize o Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ReceitasCulinariasApp());
}

class ReceitasCulinariasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receitas Culinárias',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}