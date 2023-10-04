import 'dart:io';

import 'package:cleancode/interfaceadapters/controllers/listar_productos_controller.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'interfaceadapters/controllers/crear_producto_controller.dart';

void main() {
  if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
  }
  databaseFactory = databaseFactoryFfi;

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                ListarProductosController(context).run();
              },
              child: const Text("Lista de Productos"),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                CrearProductoController(context).run();
              },
              child: const Text("Nuevo Producto"),
            ),
          ),
        ],
      ),
    );
  }
}
