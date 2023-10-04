import 'package:cleancode/domain/entities/producto.dart';

abstract class ProductoRepository {
  Future<List<Producto>> getProductos();
  Future<int> create(Producto producto);
}
