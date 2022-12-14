import 'dart:async';

import 'dart:math';

import 'package:tarea_asincronia/services/mockapi.dart';
import 'package:flutter/material.dart';

class FisherPrice extends StatefulWidget {
  const FisherPrice({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<FisherPrice> {
  // Ststatic const String _title = 'Flutter Code Sample';
  double _width = 0;
  int resultado = 0;
  bool mostrar = false;
  Color _color = Colors.cyan;
  bool animacion = false;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Ink(
              width: 90,
              height: 90,
              decoration: const ShapeDecoration(
                color: Colors.cyan,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.directions_walk,
                  color: Colors.black,
                  size: 50.0,
                ),
                color: Colors.white,
                onPressed: () async {
                  _toggleExpand();
                  resultado = await MockApi().getFisherPriceInteger() as int;
                  refresh();
                  await Future.delayed(Duration(seconds: 10));
                  mostrar = true; // Ge_toggleExpandnera un color aleatorio.
                },
              ),
            ),
            AnimatedContainer(
              // Usa setState para reconstruir el widget con nuevos valores.
              width: animacion ? _width : _width,
              height: 20,

              decoration: BoxDecoration(
                color: Colors.cyan,
              ),
              // Define la duraci??n de la animaci??n.
              duration: Duration(seconds: animacion ? 10 : 0),

              // Proporciona una curva opcional para hacer que la animaci??n se sienta m??s suave.
            ),
            Padding(
              padding: EdgeInsets.all(
                  8.0), // add space of 8.0 logical pixels on all sides
              child: Text(""),
            ),
            Text(
              '${result().toString()}',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.cyan),
            ),
          ],
        ));
  }

  refresh() {
    setState(() {
      _width = 0;
      animacion = false;
    });
  }

  _toggleExpand() {
    setState(() {
      animacion = !animacion;
      _width = 350;
    });
  }

  result() {
    return resultado;
  }
}
