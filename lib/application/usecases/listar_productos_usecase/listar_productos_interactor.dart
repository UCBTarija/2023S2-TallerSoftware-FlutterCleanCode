import 'package:cleancode/application/usecases/listar_productos_usecase/listar_productos_output.dart';
import 'package:cleancode/domain/interfaces/producto_repository.dart';

import '../../../domain/entities/producto.dart';

class ListarProductosInteractor {
  ListarProductosOutput output;
  ProductoRepository repository;

  ListarProductosInteractor({required this.output, required this.repository});

  void listarProductos() async {
    List<Producto> lista = await repository.getProductos();

    output.productosList(lista);
  }
}
