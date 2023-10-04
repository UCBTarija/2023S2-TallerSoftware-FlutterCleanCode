import 'package:cleancode/interfaceadapters/views/crear_producto_screen.dart';
import 'package:flutter/material.dart';

class CrearProductoController {
  BuildContext context;

  CrearProductoController(this.context);

  void run() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const CrearProductoScreen();
        });
  }
}
