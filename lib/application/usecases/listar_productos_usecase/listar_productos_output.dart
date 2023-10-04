import 'package:cleancode/domain/entities/producto.dart';

abstract class ListarProductosOutput {
  void productosList(List<Producto> productos);
}
