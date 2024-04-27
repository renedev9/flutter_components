import 'package:flutter/material.dart';

class SlidersPage extends StatefulWidget {
  SlidersPage({Key? key}) : super(key: key);

  @override
  State<SlidersPage> createState() => _SlidersPageState();
}

class _SlidersPageState extends State<SlidersPage> {
  double _changeValor = 100;
  bool _check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders Page'),
      ),
      body: Column(
        children: [
          _crearSlider(),
          Image(
              fit: BoxFit.contain,
              width: _changeValor,
              image: NetworkImage(
                  'https://freepngimg.com/thumb/batman/20313-3-batman-free-download.png')),
          _crearCheckBox(),
          _crearSwitch(),
        ],
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      min: 50,
      max: 400,
      value: _changeValor,
      onChanged: (valor) {
        setState(() {
          _changeValor = valor;
        });
      },
      activeColor: _check == true ? Colors.red.shade100 : Colors.red,
      inactiveColor: Colors.red.shade100,
    );
  }

  _crearCheckBox() {
    return CheckboxListTile(
        title: Text('Bloquear Slider'),
        activeColor: Colors.red,
        value: _check,
        onChanged: (value) {
          setState(() {
            _check = value!;
          });
        });
  }

  _crearSwitch() {
    return SwitchListTile(
        title: Text('Bloquear Slider'),
        activeColor: Colors.red,
        value: _check,
        onChanged: (value) {
          setState(() {
            _check = value;
          });
        });
  }
}
