import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() =>_RegisterScreenState();
  }
  class _RegisterScreenState extends
      State<RegisterScreen>{
  final TextEditingController
  correoController = TextEditingController();
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();

  bool mostrarContrasena = false;

  void registrarUsuario() {
    //pendiente: conectar con PrefererencesService de Angel.

    ScaffoldMessenger.of(context).showSnackBar
      (const SnackBar(content: Text('Formulario listo. Falta conectar el guardado.'),
    ),
    );
  }
  @override
    void dispose(){
    correoController.dispose();
    usuarioController.dispose();
    contrasenaController.dispose();
    super.dispose();
  }
  @override
    Widget build(BuildContext context)
  {
    return Scaffold(backgroundColor: const Color(0xFFF3F7FC),
    body: SafeArea(child: Center(child: SingleChildScrollView(padding: const EdgeInsets.all(24),
    child: ConstrainedBox( constraints: const BoxConstraints(maxWidth:420),
    child:Column(crossAxisAlignment:CrossAxisAlignment.stretch, children: [const CircleAvatar(radius: 43, backgroundColor:
    Color(0xFF1565C0), child: Icon(Icons.person_add_alt_1, size:44,
    color: Colors.white
        ),
    ),
      const SizedBox(height:22), const Text('Registro de usuarios',
        textAlign:TextAlign.center, style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold, color: Color(0xFF17345C),
    ),
    ),
      const SizedBox(height:8),
      const Text('Completa los siguientes datos para crear tu registro.', textAlign: TextAlign.center,
        style: TextStyle(fontSize:15, color: Colors.black54,
        ),
      ),
    const SizedBox(height:30),
    TextField(controller: correoController, keyboardType:TextInputType.emailAddress, decoration: const
    InputDecoration(labelText: 'Correo electrónico', prefixIcon: Icon(Icons.email_outlined),
    border: OutlineInputBorder(),
    ),
    ),
    const SizedBox(height:18),
    TextField(controller: usuarioController, decoration: const InputDecoration(labelText:'Nombre de usuario',
    prefixIcon: Icon(Icons.person_outline),
    border: OutlineInputBorder(),
    ),
    ),
        const SizedBox(height: 18),
        TextField(controller: contrasenaController, obscureText: !mostrarContrasena, decoration: InputDecoration(labelText:'Contraseña',
        prefixIcon: const Icon(Icons.lock_outline),
        border:const OutlineInputBorder(),
        suffixIcon: IconButton(icon: Icon(mostrarContrasena ? Icons.visibility: Icons.visibility_off,
        ),
        onPressed:(){
          setState(()
          {
            mostrarContrasena = !
          mostrarContrasena;
          });
        },
        ),
        ),
        ),
        const SizedBox(height: 18),
        SizedBox(height: 52,
        child: ElevatedButton.icon(onPressed: registrarUsuario, icon:const Icon(Icons.app_registration),
            label: const Text('Registrar', style: TextStyle(fontSize: 17),
            ),
        style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF1565C0),
        foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
            ),
        ),
        ),
        ),
        const Text('Tus datos se utilizarán para el registro de la aplicación.',
         textAlign: TextAlign.center, style:TextStyle(fontSize:12,
            color:Colors.black54,
            ),
        ),
        ],
        ),
    ),
    ),
    ),
    ),
    );
  }
}
