import 'package:cleancode/domain/entities/producto.dart';

abstract class CrearProductoOutput {
  void productoCreado(Producto producto);
  void unableToCreateProducto(Producto producto, String error);
}
