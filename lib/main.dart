import 'package:flutter/material.dart';
import 'navigation/app_router.dart';

void main() {
  runApp(const RegistroUsuariosApp());
}

class RegistroUsuariosApp extends StatelessWidget {
  const RegistroUsuariosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registro de Usuarios',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const AppRouter(),
    );
  }
}