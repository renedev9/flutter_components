import 'package:flutter/material.dart';

import 'dart:math';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({super.key});

  @override
  State<AnimatedContainerPage> createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _widht = 60.0;
  double _height = 60.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _border = BorderRadius.circular(10.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /* _widht = 20;
          _height = 50;
          _color = Colors.blue;
          _border = BorderRadius.circular(5); */
          setState(() {
            final _random =
                Random(); //Random genera digitos del 0 al 200 en este caso, numeros aleatorios

            _widht = _random.nextInt(200).toDouble();
            _height = _random.nextInt(200).toDouble();
            _color = Color.fromRGBO(_random.nextInt(255), _random.nextInt(200),
                _random.nextInt(200), 1);
          });
        },
        child: Icon(Icons.change_circle),
      ),
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          curve: Curves
              .fastOutSlowIn, // curve: es como va a ser la animacion, velocidad, trayectoria, etc
          height: _height,
          width: _widht,
          decoration: BoxDecoration(color: _color, borderRadius: _border),
          duration: Duration(milliseconds: 1000),
        ),
      ),
    );
  }
}
