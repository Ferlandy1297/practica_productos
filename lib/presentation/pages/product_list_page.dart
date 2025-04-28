import 'package:flutter/material.dart';
import '../../../core/api/api_service_product.dart';
import 'product_detail_page.dart';

class ProductListPage extends StatefulWidget {
  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final ApiServiceProduct apiService = ApiServiceProduct();
  late Future<List<dynamic>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = apiService.getProducts();
  }

  void _refreshProducts() {
    setState(() {
      _productsFuture = apiService.getProducts();
    });
  }

  void _openForm({Map<String, dynamic>? product}) {
    final _nameController = TextEditingController(text: product?['name'] ?? '');

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Para subir si aparece teclado
      builder:
          (context) => Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 16,
              right: 16,
              top: 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(product == null ? 'Agregar Producto' : 'Editar Producto'),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Nombre del producto'),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    if (product == null) {
                      // Crear producto
                      await apiService.createProduct({
                        "name": _nameController.text,
                        "data": {},
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Producto creado')),
                      );
                    } else {
                      // Editar producto
                      await apiService.updateProduct(product['id'], {
                        "name": _nameController.text,
                        "data": {},
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Producto actualizado')),
                      );
                    }
                    Navigator.pop(context);
                    _refreshProducts();
                  },
                  child: Text(product == null ? 'Crear' : 'Actualizar'),
                ),
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Productos')),
      body: FutureBuilder<List<dynamic>>(
        future: _productsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error al cargar productos'));
          } else {
            final products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  title: Text(product['name'] ?? 'Sin nombre'),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/detalle',
                      arguments: product,
                    );
                  },
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => _openForm(product: product),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          await apiService.deleteProduct(product['id']);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Producto eliminado')),
                          );
                          _refreshProducts();
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openForm(),
        child: Icon(Icons.add),
      ),
    );
  }
}
