import 'package:flutter/material.dart'; // Importa los componentes de Material.

class TarjetaUae extends StatelessWidget {
  // Define una tarjeta reutilizable sin estado.
  const TarjetaUae({
    // Permite crear tarjetas constantes desde cualquier pantalla.
    super.key, // Acepta una clave para identificar el widget en el árbol.
    this.titulo =
        'Tarjeta UAE', // Ofrece el título solicitado como valor inicial.
    this.descripcion =
        'Universidad Agraria\ndel Ecuador', // Define el texto inicial.
  }); // Termina el constructor de la tarjeta.

  final String
  titulo; // Permite personalizar el título al reutilizar la tarjeta.
  final String
  descripcion; // Permite personalizar la descripción del componente.

  @override // Implementa la construcción del componente.
  Widget build(BuildContext context) {
    // Recibe el contexto del árbol de widgets.
    return Container(
      // Dibuja el contorno y el fondo de la tarjeta de referencia.
      padding: const EdgeInsets.all(24), // Separa el contenido del borde.
      decoration: BoxDecoration(
        // Configura los colores y la forma de la tarjeta.
        color: const Color(0xFFEAF5EF), // Aplica un fondo verde claro.
        border: Border.all(
          // Resalta el límite del componente.
          color: const Color(0xFF2F8943), // Usa verde para el contorno.
          width: 2, // Define un borde de dos píxeles lógicos.
        ), // Termina el borde de la tarjeta.
        borderRadius: BorderRadius.circular(16), // Redondea las esquinas.
      ), // Termina la decoración exterior.
      child: Column(
        // Organiza el emblema, el título y la descripción.
        mainAxisSize: MainAxisSize.min, // Ajusta la altura al contenido.
        children: [
          // Inicia los elementos de la tarjeta.
          const CircleAvatar(
            // Presenta el emblema textual de la referencia.
            radius: 26, // Define el tamaño del círculo.
            backgroundColor: Color(0xFF2F8943), // Pinta el emblema de verde.
            foregroundColor: Colors.white, // Usa letras blancas.
            child: FittedBox(
              // Adapta las siglas si aumenta el tamaño de letra.
              child: Padding(
                // Mantiene espacio alrededor de las siglas.
                padding: EdgeInsets.all(
                  4,
                ), // Aplica un margen interior pequeño.
                child: Text(
                  // Dibuja las siglas de la universidad.
                  'UAE', // Identifica a la Universidad Agraria del Ecuador.
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ), // Resalta las siglas.
                ), // Termina el texto del emblema.
              ), // Termina el margen interior del emblema.
            ), // Termina el ajuste del texto al círculo.
          ), // Termina el emblema circular.
          const SizedBox(height: 16), // Separa el emblema del título.
          Text(
            // Presenta el título configurable del componente.
            titulo, // Usa el valor recibido por el constructor.
            textAlign: TextAlign.center, // Centra el título en la tarjeta.
            style: const TextStyle(
              // Mantiene una jerarquía visual clara.
              color: Color(0xFF2F8943), // Usa el verde del contorno.
              fontSize: 20, // Resalta el nombre de la tarjeta.
              fontWeight: FontWeight.bold, // Aplica negrita al título.
            ), // Termina el estilo del título.
          ), // Termina el título de la tarjeta.
          const SizedBox(height: 8), // Separa el título de la descripción.
          Text(
            // Presenta la descripción configurable del componente.
            descripcion, // Usa el valor recibido al crear la tarjeta.
            textAlign: TextAlign.center, // Centra las líneas de descripción.
            style: const TextStyle(
              // Define la apariencia de la descripción.
              color: Color(
                0xFF213247,
              ), // Ofrece contraste sobre el fondo claro.
              fontSize: 15, // Mantiene una lectura cómoda.
              height: 1.4, // Separa las líneas de la universidad.
            ), // Termina el estilo de la descripción.
          ), // Termina la descripción de la tarjeta.
        ], // Termina la lista de elementos de la tarjeta.
      ), // Termina la columna interior.
    ); // Termina el contenedor de la tarjeta.
  } // Termina la construcción del componente.
} // Termina la clase del widget reutilizable.
