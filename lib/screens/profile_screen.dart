import 'package:flutter/material.dart';
import '../services/preferences_service.dart';
import 'register_screen.dart';

class ProfileScreen extends
StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState()
  => _ProfileScreenState();
}
class _ProfileScreenState extends
    State<ProfileScreen> {
  late Future<Map <String, String>> usuarioFuture;

  @override
  void initState(){
  super.initState();
  usuarioFuture = PreferencesService.obtenerUsuario();
}
Future<void> cerrearSesion() async {
  await PreferencesService.cerrarSesion();
  if (!mounted) return;

  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> const RegisterScreen(),
  ), (route) => false,
  );
}

@override
Widget build(BuildContext context)
{
  return Scaffold(appBar: AppBar(title: const Text('Mi perfil'),
  centerTitle: true,),
  body: FutureBuilder<Map<String,String>> (future: usuarioFuture,
  builder: (context, snapshot)
    {
      if(snapshot.connectionState == ConnectionState.waiting){
        return const Center(child: CircularProgressIndicator(),);
      }
      if (snapshot.hasError){
        return const Center(child: Text('Error al cargar los datos del usuario',),
        );
      }
      final usuario = snapshot.data ?? {};
      final nombre = usuario['usuario'] ?? '';
      final correo = usuario['correo'] ?? '';

      return SingleChildScrollView(padding: const EdgeInsets.all(24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [const SizedBox(height: 20),
      const CircleAvatar(radius: 48, child: Icon(Icons.person, size: 55,),
      ),
      const SizedBox(height: 15),
      Text(nombre.isEmpty ? 'usuario': nombre, textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      const SizedBox(height: 30),
      const Text('Informacion personal',
      style:  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 12),
      Card(child: ListTile(leading: const Icon(Icons.person),
      title: const Text('Nombre de usuario',),
      subtitle: Text(nombre.isEmpty ? 'No disponible': nombre,),
      ),
      ),
      Card(child: ListTile(leading: const Icon(Icons.email),
      title: const Text('Correo electronico',),
      subtitle: Text(correo.isEmpty ? 'No disponible' : correo,),
      ),
      ),
      const SizedBox(height: 30),
      ElevatedButton.icon(onPressed: cerrearSesion, icon: const Icon(Icons.logout),
      label: const Text('Cerrar sesion'),
      style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(15),
      ),
      ),
      ],
      ),
      );
    },
  ),
  );
}
}
