import 'package:flutter/material.dart';

import '../../application/usecases/crear_producto_usecase/crear_producto_output.dart';
import '../../domain/entities/producto.dart';

class CrearProductoPresenter implements CrearProductoOutput {
  BuildContext context;

  CrearProductoPresenter(this.context);

  @override
  void productoCreado(Producto producto) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text("Exito"),
            content: SizedBox(
              width: 400,
              height: 300,
              child: Text("Producto creado"),
            ),
          );
        });
  }

  @override
  void unableToCreateProducto(Producto producto, String error) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: SizedBox(
              width: 400,
              height: 300,
              child: Text(error),
            ),
          );
        });
  }

  // Widget _buildListContent() {
  //   List<Widget> lista = List.empty(growable: true);

  //   for (Map producto in _productos) {
  //     lista.add(Text(producto['id'] + " : " + producto['nombre']));
  //   }

  //   return ListView(children: lista);
  // }
}
