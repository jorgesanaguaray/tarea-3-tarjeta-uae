import 'package:flutter/material.dart'; // Proporciona los widgets que se verifican.
import 'package:flutter_test/flutter_test.dart'; // Permite probar la interfaz.
import 'package:tarea_3_tarjeta_uae/main.dart'; // Importa la aplicación completa.
import 'package:tarea_3_tarjeta_uae/presentation/screens/acerca_de/acerca_de_screen.dart'; // Importa la segunda pantalla.
import 'package:tarea_3_tarjeta_uae/presentation/widgets/tarjeta_uae.dart'; // Importa el widget reutilizable.

void main() {
  // Agrupa las pruebas de la tarea.
  testWidgets('Permite abrir Acerca de y regresar al LOGIN', (tester) async {
    // Comprueba la navegación completa.
    await tester.pumpWidget(
      const MyApp(),
    ); // Inicia la aplicación como lo hace main.
    expect(find.text('LOGIN'), findsOneWidget); // Confirma la pantalla inicial.
    await tester.tap(find.text('Acerca de')); // Abre la segunda pantalla.
    await tester.pumpAndSettle(); // Espera a que termine la transición.
    expect(
      find.byType(AcercaDeScreen),
      findsOneWidget,
    ); // Confirma la pantalla solicitada.
    expect(
      find.byType(TarjetaUae),
      findsOneWidget,
    ); // Comprueba que la tarjeta se utiliza.
    expect(
      find.text('Pantalla "Acerca de" -> Tarjeta UAE (widget reutilizable)'),
      findsOneWidget,
    ); // Verifica el resultado exacto.
    await tester.pageBack(); // Pulsa el botón de regreso de la barra superior.
    await tester.pumpAndSettle(); // Espera la transición de regreso.
    expect(
      find.text('LOGIN'),
      findsOneWidget,
    ); // Confirma el retorno al formulario.
    expect(
      find.byType(AcercaDeScreen),
      findsNothing,
    ); // Comprueba que se cerró la segunda ruta.
    expect(
      tester.takeException(),
      isNull,
    ); // Descarta errores durante la navegación.
  }); // Termina la prueba de navegación.

  testWidgets('Conserva los campos de clase y oculta la contraseña', (
    tester,
  ) async {
    // Revisa el formulario original.
    await tester.pumpWidget(const MyApp()); // Construye la pantalla inicial.
    final campos = tester
        .widgetList<TextField>(find.byType(TextField))
        .toList(); // Obtiene los campos del formulario.
    expect(campos, hasLength(2)); // Comprueba que existen usuario y contraseña.
    expect(
      campos[0].decoration?.labelText,
      'Usuario',
    ); // Verifica la etiqueta del usuario.
    expect(
      campos[1].decoration?.labelText,
      'Contraseña',
    ); // Verifica la etiqueta de la contraseña.
    expect(
      campos[1].obscureText,
      isTrue,
    ); // Exige que la contraseña se muestre oculta.
    await tester.enterText(
      find.byType(TextField).first,
      'estudiante',
    ); // Introduce un usuario de demostración.
    await tester.enterText(
      find.byType(TextField).last,
      'clave-de-prueba',
    ); // Introduce una contraseña de prueba.
    expect(
      tester.takeException(),
      isNull,
    ); // Confirma que ambos campos admiten texto.
  }); // Termina la prueba del formulario.

  testWidgets('La tarjeta permite reutilizar contenido y conserva su key', (
    tester,
  ) async {
    // Revisa la personalización del widget.
    const tarjetaKey = ValueKey(
      'tarjeta-personalizada',
    ); // Identifica una instancia reutilizada.
    const tarjeta = TarjetaUae(
      key: tarjetaKey,
      titulo: 'Otra tarjeta',
      descripcion: 'Contenido de ejemplo',
    ); // Crea una instancia con datos propios.
    expect(
      tarjeta.key,
      tarjetaKey,
    ); // Comprueba que el constructor recibe la key.
    expect(
      tarjeta,
      isA<StatelessWidget>(),
    ); // Confirma que la tarjeta no requiere estado mutable.
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: tarjeta)),
    ); // Usa el widget fuera de Acerca de.
    expect(
      find.text('Otra tarjeta'),
      findsOneWidget,
    ); // Comprueba el título recibido.
    expect(
      find.text('Contenido de ejemplo'),
      findsOneWidget,
    ); // Comprueba la descripción recibida.
    expect(
      tester.takeException(),
      isNull,
    ); // Descarta errores al reutilizar la tarjeta.
  }); // Termina la prueba del widget reutilizable.

  testWidgets('Las pantallas admiten ancho reducido y texto ampliado', (
    tester,
  ) async {
    // Revisa que el contenido no se desborde.
    tester.view.physicalSize = const Size(
      320,
      568,
    ); // Simula un teléfono de pantalla estrecha.
    tester.view.devicePixelRatio = 1; // Expresa las medidas en píxeles lógicos.
    tester.platformDispatcher.textScaleFactorTestValue =
        2; // Duplica el tamaño del texto.
    addTearDown(
      tester.view.resetPhysicalSize,
    ); // Restaura el tamaño después de la prueba.
    addTearDown(
      tester.view.resetDevicePixelRatio,
    ); // Restaura la densidad de la pantalla.
    addTearDown(
      tester.platformDispatcher.clearTextScaleFactorTestValue,
    ); // Restaura la escala del texto.
    await tester.pumpWidget(
      const MyApp(),
    ); // Dibuja el formulario con las dimensiones de prueba.
    expect(
      tester.takeException(),
      isNull,
    ); // Descarta desbordamientos del LOGIN.
    await tester.ensureVisible(
      find.text('Acerca de'),
    ); // Desplaza el formulario hasta el botón si hace falta.
    await tester.tap(find.text('Acerca de')); // Abre la segunda pantalla.
    await tester.pumpAndSettle(); // Espera a que termine la navegación.
    expect(
      find.byType(AcercaDeScreen),
      findsOneWidget,
    ); // Confirma la segunda pantalla.
    expect(
      tester.takeException(),
      isNull,
    ); // Descarta errores con el texto ampliado.
    await tester.ensureVisible(
      find.text('Pantalla "Acerca de" -> Tarjeta UAE (widget reutilizable)'),
    ); // Desplaza hasta el resultado completo.
    expect(
      tester.takeException(),
      isNull,
    ); // Comprueba que el resultado sigue siendo accesible.
  }); // Termina la prueba de tamaño y accesibilidad.
} // Cierra el conjunto de pruebas.
