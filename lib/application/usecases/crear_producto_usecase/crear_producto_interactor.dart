import 'package:cleancode/domain/interfaces/producto_repository.dart';

import '../../../domain/entities/producto.dart';
import 'crear_producto_output.dart';

class CrearProductoInteractor {
  CrearProductoOutput output;
  ProductoRepository repository;

  CrearProductoInteractor({required this.output, required this.repository});

  void crearProducto(Producto producto) async {
    final count = await repository.create(producto);

    if (count > 0) {
      output.productoCreado(producto);
    } else {
      output.unableToCreateProducto(producto, "Error al crear el producto");
    }
  }
}
