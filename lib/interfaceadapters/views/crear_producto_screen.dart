import 'package:cleancode/application/usecases/crear_producto_usecase/crear_producto_interactor.dart';
import 'package:cleancode/interfaceadapters/gateways/sqlite/producto_repository_impl.dart';
import 'package:cleancode/interfaceadapters/presenters/crear_producto_presenter.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/producto.dart';

class CrearProductoScreen extends StatefulWidget {
  const CrearProductoScreen({super.key});

  @override
  State<CrearProductoScreen> createState() => _CrearProductoScreenState();
}

class _CrearProductoScreenState extends State<CrearProductoScreen> {
  GlobalKey<FormState> keyForm = GlobalKey();
  TextEditingController idCtrl = TextEditingController();
  TextEditingController nombreCtrl = TextEditingController();

  @override
  Widget build(Object context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Nuevo Producto'),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(60.0),
            child: Form(
              key: keyForm,
              child: formUI(),
            ),
          ),
        ),
      ),
    );
  }

  formItemsDesign(icon, item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Card(child: ListTile(leading: Icon(icon), title: item)),
    );
  }

  Widget formUI() {
    return Column(
      children: <Widget>[
        formItemsDesign(
            Icons.info_outline,
            TextFormField(
              controller: idCtrl,
              decoration: const InputDecoration(
                labelText: 'ID',
              ),
              maxLength: 10,
            )),
        formItemsDesign(
            Icons.info_outline,
            TextFormField(
              controller: nombreCtrl,
              decoration: const InputDecoration(
                labelText: 'Nombre del producto',
              ),
              maxLength: 10,
            )),
        ElevatedButton(onPressed: () => save(), child: const Text("Guardar")),
        ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cerrar")),
      ],
    );
  }

  save() async {
    if (keyForm.currentState!.validate()) {
      CrearProductoInteractor interactor = CrearProductoInteractor(
          output: CrearProductoPresenter(context),
          repository: ProductoRepositoryImpl());

      final producto = Producto(id: idCtrl.text, nombre: nombreCtrl.text);

      interactor.crearProducto(producto);
    }
  }
}
