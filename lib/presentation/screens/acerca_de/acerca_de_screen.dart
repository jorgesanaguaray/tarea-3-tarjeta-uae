import 'package:flutter/material.dart'; // Importa los widgets de Material.

import '../../widgets/tarjeta_uae.dart'; // Importa el widget reutilizable.

class AcercaDeScreen extends StatelessWidget {
  // Define la segunda pantalla sin estado.
  const AcercaDeScreen({
    super.key,
  }); // Admite key y const como pide la consigna.

  @override // Implementa la construcción de la segunda pantalla.
  Widget build(BuildContext context) {
    // Recibe el contexto del tema y la ruta.
    return Scaffold(
      // Proporciona un Scaffold independiente del login.
      appBar: AppBar(
        title: const Text('Acerca de'),
      ), // Incluye el regreso automático.
      body: SafeArea(
        // Respeta las áreas reservadas del dispositivo.
        child: SingleChildScrollView(
          // Evita desbordes con pantallas o letras grandes.
          padding: const EdgeInsets.fromLTRB(
            24,
            48,
            24,
            32,
          ), // Define los márgenes.
          child: Center(
            // Centra el contenido horizontalmente.
            child: ConstrainedBox(
              // Facilita la lectura en pantallas anchas.
              constraints: const BoxConstraints(
                maxWidth: 480,
              ), // Limita el ancho.
              child: const Column(
                // Agrupa la tarjeta y sus textos explicativos.
                crossAxisAlignment:
                    CrossAxisAlignment.stretch, // Aprovecha el ancho.
                children: [
                  // Inicia el contenido de Acerca de.
                  TarjetaUae(), // Usa el componente de presentation/widgets.
                  SizedBox(height: 24), // Separa la tarjeta de su descripción.
                  Text(
                    // Presenta la etiqueta de la captura de referencia.
                    'presentation/widgets · reutilizable', // Ubicación del widget.
                    textAlign: TextAlign.center, // Centra la etiqueta.
                    style: TextStyle(
                      // Define una jerarquía visual secundaria.
                      color: Color(
                        0xFF646B76,
                      ), // Usa gris legible sobre blanco.
                      fontSize: 13, // Mantiene la etiqueta discreta.
                    ), // Termina el estilo de la etiqueta.
                  ), // Termina la etiqueta del componente.
                  SizedBox(height: 32), // Separa el resultado exigido.
                  Text(
                    // Muestra la salida literal solicitada en la tarea.
                    'Pantalla "Acerca de" -> Tarjeta UAE (widget reutilizable)', // Resultado.
                    textAlign:
                        TextAlign.center, // Centra las líneas del resultado.
                    style: TextStyle(
                      // Destaca la salida de la aplicación.
                      color: Color(
                        0xFF203A5E,
                      ), // Usa el azul de la barra superior.
                      fontSize: 16, // Mantiene el resultado legible.
                      fontWeight: FontWeight.w600, // Resalta el resultado.
                    ), // Termina el estilo del resultado.
                  ), // Termina el texto del resultado.
                ], // Termina la lista de widgets constantes.
              ), // Termina la columna.
            ), // Termina la restricción de ancho.
          ), // Termina el centrado horizontal.
        ), // Termina el contenido desplazable.
      ), // Termina el área segura.
    ); // Termina el Scaffold de Acerca de.
  } // Termina la construcción de la segunda pantalla.
} // Termina la clase de Acerca de.
