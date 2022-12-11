import 'package:tarea_asincronia/services/mockapi.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'Ferrari.dart';
import 'FisherPrice.dart';
import 'hyundai.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Villamar Alcivar Belen-Asincronia';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  // Define las diferentes propiedades con valores por defecto.
  // Actualiza estas propiedades cuando el usuario toque un FloatingActionButton.
  double _width = 50;
  double _height = 50;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  Widget build(BuildContext context) {
    return Material(
        child: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Ferrari(),
            Hyundai(),
            FisherPrice(),
          ]),
    ));
  }
}
