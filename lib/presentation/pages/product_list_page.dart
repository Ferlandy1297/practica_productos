import 'package:flutter/material.dart'; // Importa el paquete de widgets de Flutter.

// Esta clase representa la pantalla que muestra la lista de productos.
class ProductListPage extends StatelessWidget {
  // Lista de productos ficticios para mostrar en pantalla.
  final List<String> productos = ['Camiseta', 'Zapatos', 'Gorra'];

  @override
  Widget build(BuildContext context) {
    // Estructura principal de la pantalla con AppBar y cuerpo.
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Productos'), // Título en la parte superior.
      ),
      body: ListView.builder(
        itemCount: productos.length, // Cantidad de elementos a mostrar.
        itemBuilder: (context, index) {
          // Por cada producto, crea una lista con un título (el nombre del producto).
          return ListTile(
            title: Text(productos[index]), // Nombre del producto.
            onTap: () {
              // Cuando el usuario toca un producto, navega a la pantalla de detalle.
              Navigator.pushNamed(
                context,
                '/detalle', // Ruta nombrada que debe estar registrada en main.dart
                arguments:
                    productos[index], // Pasa el nombre del producto como argumento.
              );
            },
          );
        },
      ),
    );
  }
}
