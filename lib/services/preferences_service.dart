import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {

  // Claves para almacenar los datos
  static const String _keyCorreo = 'correo';
  static const String _keyUsuario = 'usuario';
  static const String _keyContrasena = 'contrasena';
  static const String _keyRegistroCompleto = 'registroCompleto';

  // 1. Guardar usuario
  static Future<void> guardarUsuario({
    required String correo,
    required String usuario,
    required String contrasena,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_keyCorreo, correo);
    await prefs.setString(_keyUsuario, usuario);
    await prefs.setString(_keyContrasena, contrasena);

    await prefs.setBool(_keyRegistroCompleto, true);
  }

  // 2. Obtener usuario
  static Future<Map<String, String>> obtenerUsuario() async {
    final prefs = await SharedPreferences.getInstance();

    return {
      'correo': prefs.getString(_keyCorreo) ?? '',
      'usuario': prefs.getString(_keyUsuario) ?? '',
      'contrasena': prefs.getString(_keyContrasena) ?? '',
    };
  }

  // 3. Comprobar si tiene registro
  static Future<bool> tieneRegistro() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool(_keyRegistroCompleto) ?? false;
  }

  // 4. Cerrar sesión
  static Future<void> cerrarSesion() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_keyCorreo);
    await prefs.remove(_keyUsuario);
    await prefs.remove(_keyContrasena);

    await prefs.setBool(_keyRegistroCompleto, false);
  }
}