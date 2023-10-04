import 'package:cleancode/application/usecases/listar_productos_usecase/listar_productos_output.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/producto.dart';

class ListaProductosPresenter implements ListarProductosOutput {
  BuildContext context;

  ListaProductosPresenter(this.context);

  late List<Producto> _productos;

  @override
  void productosList(List<Producto> productos) {
    _productos = productos;

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Test"),
            content: SizedBox(
              width: 400,
              height: 300,
              child: _buildTableContent(),
            ),
          );
        });
  }

  Widget _buildTableContent() {
    List<DataRow> filas = List.empty(growable: true);

    for (Producto producto in _productos) {
      filas.add(
        DataRow(
          cells: [
            DataCell(Text(producto.id)),
            DataCell(Text(producto.nombre)),
          ],
        ),
      );
    }
    return DataTable(
      columns: const [
        DataColumn(label: Text("ID")),
        DataColumn(label: Text("NOMBRE")),
      ],
      rows: filas,
    );
  }

  // Widget _buildListContent() {
  //   List<Widget> lista = List.empty(growable: true);

  //   for (Map producto in _productos) {
  //     lista.add(Text(producto['id'] + " : " + producto['nombre']));
  //   }

  //   return ListView(children: lista);
  // }
}
