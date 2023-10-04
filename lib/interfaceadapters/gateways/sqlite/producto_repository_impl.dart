import 'package:cleancode/domain/entities/producto.dart';
import 'package:cleancode/interfaceadapters/gateways/sqlite/sqlite_db_provider.dart';

import '../../../domain/interfaces/producto_repository.dart';

class ProductoRepositoryImpl implements ProductoRepository {
  @override
  Future<List<Producto>> getProductos() async {
    final db = await SQLiteDbProvider.getDb();
    List<Map> data = await db.rawQuery("SELECT * FROM producto");

    List<Producto> productos = List.empty(growable: true);

    for (Map row in data) {
      productos.add(Producto(id: row['id'], nombre: row['nombre']));
    }

    return productos;
  }

  @override
  Future<int> create(Producto producto) async {
    final db = await SQLiteDbProvider.getDb();

    return await db.rawInsert(
        "INSERT INTO producto(id, nombre)"
        "VALUES(?, ?)",
        [producto.id, producto.nombre]);
  }
}
