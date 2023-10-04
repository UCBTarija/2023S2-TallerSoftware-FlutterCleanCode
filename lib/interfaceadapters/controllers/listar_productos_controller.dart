import 'package:flutter/material.dart';

import '../../application/usecases/listar_productos_usecase/listar_productos_interactor.dart';
import '../gateways/sqlite/producto_repository_impl.dart';
import '../presenters/lista_productos_presenter.dart';

class ListarProductosController {
  BuildContext context;

  ListarProductosController(this.context);

  void run() {
    ListarProductosInteractor usecase = ListarProductosInteractor(
        output: ListaProductosPresenter(context),
        repository: ProductoRepositoryImpl());

    usecase.listarProductos();
  }
}
