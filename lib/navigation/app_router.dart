import 'package:flutter/material.dart';

import '../screens/register_screen.dart';
import '../screens/profile_screen.dart';
import '../services/preferences_service.dart';

class AppRouter extends StatelessWidget {
  const AppRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: PreferencesService.tieneRegistro(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Text('Error al consultar el registro'),
            ),
          );
        }

        if (snapshot.data == true) {
          return const ProfileScreen();
        }

        return const RegisterScreen();
      },
    );
  }
}