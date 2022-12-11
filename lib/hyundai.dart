import 'dart:async';

import 'dart:math';
import 'package:tarea_asincronia/services/mockapi.dart';
import 'package:flutter/material.dart';

class Hyundai extends StatefulWidget {
  const Hyundai({Key? key}) : super(key: key);

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

class _ListScreenState extends State<Hyundai> {
  // Ststatic const String _title = 'Flutter Code Sample';
  double _width = 0;
  int resultado = 0;
  bool mostrar = false;
  bool animacion = false;
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
                color: Colors.yellow,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.airplanemode_active_sharp,
                  color: Colors.black,
                  size: 50.0,
                ),
                color: Colors.transparent,
                onPressed: () async {
                  _toggleExpand();
                  resultado = await MockApi().getHyundaiInteger() as int;
                  refresh();
                  await Future.delayed(Duration(seconds: 3));

                  mostrar = true;

                  // Ge_toggleExpandnera un color aleatorio.
                },
              ),
            ),
            AnimatedContainer(
              // Usa setState para reconstruir el widget con nuevos valores.
              width: animacion ? _width : _width,
              height: 20,

              decoration: BoxDecoration(
                color: Colors.yellow,
              ),
              // Define la duración de la animación.
              duration: Duration(seconds: animacion ? 3 : 0),

              // Proporciona una curva opcional para hacer que la animación se sienta más suave.
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
                  color: Colors.yellow),
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
