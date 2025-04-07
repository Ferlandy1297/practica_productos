import 'package:flutter/material.dart';

class ProductListPage extends StatelessWidget {
  final List<String> productos = ['Camiseta', 'Zapatos', 'Gorra'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Productos')),
      body: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(productos[index]),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/detalle',
                arguments: productos[index],
              );
            },
          );
        },
      ),
    );
  }
}
