// Importa los widgets y funciones esenciales de Flutter.
import 'package:flutter/material.dart';

// Importa las dos pantallas de la aplicación: lista de productos y detalle.
import 'presentation/pages/product_list_page.dart';
import 'presentation/pages/product_detail_page.dart';

// Función principal que se ejecuta al iniciar la app.
void main() {
  runApp(MyApp()); // Inicia la aplicación llamando a MyApp.
}

// Widget principal de la aplicación.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // Oculta la etiqueta de debug en la esquina.
      title: 'Productos App', // Título general de la aplicación.

      initialRoute: '/', // Define la ruta inicial al iniciar la app.
      // Mapa de rutas nombradas.
      routes: {
        // Ruta principal que muestra la lista de productos.
        '/': (context) => ProductListPage(),

        // Ruta de detalle que muestra la información de un producto.
        '/detalle': (context) => ProductDetailPage(),
      },
    );
  }
}
