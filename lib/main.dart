import 'package:flutter/material.dart'; // Importa los widgets de Material.

import 'presentation/screens/login/login_screen.dart'; // Importa el login.

void main() {
  // Define el punto de entrada de la aplicación.
  runApp(const MyApp()); // Inicia la aplicación con un widget constante.
} // Termina la función principal.

class MyApp extends StatelessWidget {
  // Configura la aplicación sin estado mutable.
  const MyApp({super.key}); // Admite una clave y construcción constante.

  @override // Implementa la construcción del widget principal.
  Widget build(BuildContext context) {
    // Recibe el contexto del árbol de widgets.
    return MaterialApp(
      // Proporciona el tema y la navegación de la aplicación.
      title: 'Tarjeta UAE', // Define el nombre de la aplicación.
      debugShowCheckedModeBanner: false, // Oculta la etiqueta de depuración.
      theme: ThemeData(
        // Centraliza los estilos de ambas pantallas.
        colorScheme: ColorScheme.fromSeed(
          // Genera una paleta de colores.
          seedColor: const Color(0xFF203A5E), // Usa el azul de la referencia.
        ), // Termina la configuración de colores.
        scaffoldBackgroundColor: Colors.white, // Mantiene el fondo blanco.
        appBarTheme: const AppBarTheme(
          // Comparte el diseño de las barras.
          backgroundColor: Color(0xFF203A5E), // Pinta la barra de azul oscuro.
          foregroundColor: Colors.white, // Usa títulos e iconos blancos.
          centerTitle: false, // Alinea el título al inicio de la barra.
        ), // Termina el tema de las barras.
        inputDecorationTheme: const InputDecorationTheme(
          // Unifica los campos.
          border: OutlineInputBorder(), // Dibuja el borde del ejemplo de clase.
        ), // Termina el tema de los campos.
      ), // Termina el tema general.
      home: const LoginScreen(), // Abre la pantalla inicial vista en clase.
    ); // Termina la configuración de MaterialApp.
  } // Termina la construcción de la aplicación.
} // Termina la clase principal.
