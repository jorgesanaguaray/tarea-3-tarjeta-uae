import 'package:flutter/material.dart'; // Importa los widgets de Material.

import '../acerca_de/acerca_de_screen.dart'; // Importa la segunda pantalla.

class LoginScreen extends StatelessWidget {
  // Conserva el tipo del login de clase.
  const LoginScreen({super.key}); // Admite una clave y construcción constante.

  @override // Implementa la construcción de la pantalla inicial.
  Widget build(BuildContext context) {
    // Recibe el contexto para navegar.
    return Scaffold(
      // Proporciona una estructura propia para el login.
      appBar: AppBar(
        title: const Text('LOGIN'),
      ), // Conserva el título de clase.
      body: SafeArea(
        // Evita las zonas reservadas del dispositivo.
        child: Center(
          // Centra el formulario en el área disponible.
          child: SingleChildScrollView(
            // Permite desplazarse con el teclado abierto.
            padding: const EdgeInsets.all(
              24,
            ), // Separa el contenido de los bordes.
            child: ConstrainedBox(
              // Limita el ancho en tabletas y navegadores.
              constraints: const BoxConstraints(
                maxWidth: 420,
              ), // Ancho del formulario.
              child: Column(
                // Ordena los campos y el botón verticalmente.
                mainAxisSize:
                    MainAxisSize.min, // Ocupa solo la altura necesaria.
                crossAxisAlignment:
                    CrossAxisAlignment.stretch, // Iguala los anchos.
                children: [
                  // Inicia los elementos visibles del formulario.
                  const Icon(
                    // Identifica visualmente el formulario académico.
                    Icons.school_outlined, // Muestra el símbolo de educación.
                    size: 52, // Define el tamaño del icono.
                    color: Color(0xFF203A5E), // Usa el azul de la aplicación.
                  ), // Termina el icono.
                  const SizedBox(height: 16), // Separa el icono del título.
                  Text(
                    // Presenta el nombre de la universidad.
                    'Universidad Agraria del Ecuador', // Texto del encabezado.
                    textAlign:
                        TextAlign.center, // Centra el texto del encabezado.
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge, // Usa el tema.
                  ), // Termina el encabezado.
                  const SizedBox(
                    height: 32,
                  ), // Separa el título del formulario.
                  const TextField(
                    // Conserva el campo de usuario visto en clase.
                    textInputAction:
                        TextInputAction.next, // Avanza al siguiente campo.
                    autocorrect: false, // Evita corregir nombres de usuario.
                    decoration: InputDecoration(
                      // Describe el campo de usuario.
                      labelText: 'Usuario', // Conserva la etiqueta del ejemplo.
                      prefixIcon: Icon(
                        Icons.person_outline,
                      ), // Identifica el usuario.
                    ), // Termina la decoración del primer campo.
                  ), // Termina el campo de usuario.
                  const SizedBox(height: 16), // Mantiene el espaciado de clase.
                  const TextField(
                    // Conserva el campo de contraseña de clase.
                    obscureText:
                        true, // Oculta los caracteres de la contraseña.
                    autocorrect: false, // Evita correcciones en la contraseña.
                    enableSuggestions:
                        false, // Desactiva sugerencias del teclado.
                    textInputAction:
                        TextInputAction.done, // Permite finalizar la entrada.
                    decoration: InputDecoration(
                      // Describe el campo de contraseña.
                      labelText:
                          'Contraseña', // Conserva la etiqueta del ejemplo.
                      prefixIcon: Icon(
                        Icons.lock_outline,
                      ), // Identifica la contraseña.
                    ), // Termina la decoración del segundo campo.
                  ), // Termina el campo de contraseña.
                  const SizedBox(
                    height: 24,
                  ), // Separa el formulario de la navegación.
                  FilledButton.icon(
                    // Permite visitar la segunda pantalla.
                    onPressed: () {
                      // Responde a la pulsación del botón.
                      FocusScope.of(context)
                          .unfocus(); // Cierra el teclado al navegar.
                      Navigator.of(context).push<void>(
                        // Conserva el login en la pila.
                        MaterialPageRoute<void>(
                          // Crea una transición Material.
                          builder: (context) =>
                              const AcercaDeScreen(), // Abre Acerca de.
                        ), // Termina la nueva ruta.
                      ); // Finaliza la solicitud de navegación.
                    }, // Termina la acción del botón.
                    icon: const Icon(
                      Icons.info_outline,
                    ), // Identifica la información.
                    label: const Text(
                      'Acerca de',
                    ), // Nombra el destino del botón.
                  ), // Termina el botón de navegación.
                ], // Termina la lista de elementos del formulario.
              ), // Termina la columna.
            ), // Termina la restricción de ancho.
          ), // Termina el contenido desplazable.
        ), // Termina el centrado.
      ), // Termina el área segura.
    ); // Termina la estructura del login.
  } // Termina la construcción del login.
} // Termina la pantalla inicial.
