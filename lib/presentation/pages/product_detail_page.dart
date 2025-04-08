import 'package:flutter/material.dart'; // Importa los widgets básicos de Flutter.

// Esta clase representa la pantalla de detalle del producto.
class ProductDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Recupera el argumento pasado desde la pantalla anterior (el nombre del producto).
    final String nombreProducto =
        ModalRoute.of(context)!.settings.arguments as String;

    // Estructura de la pantalla
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle del Producto'), // Título de la barra superior.
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Centra verticalmente los elementos.
          children: [
            // Texto descriptivo.
            Text('Producto seleccionado:', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10), // Espacio entre los textos.
            // Muestra el nombre del producto con estilo llamativo.
            Text(
              nombreProducto,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20), // Espacio antes del botón.
            // Botón para regresar a la pantalla de lista.
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Regresa a la pantalla anterior.
              },
              child: Text('Volver a la lista'), // Texto del botón.
            ),
          ],
        ),
      ),
    );
  }
}
