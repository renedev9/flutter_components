import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  HomePageTemp({super.key});

  final List<String> opciones = ['uno', 'dos', 'tres', 'cuatro', 'cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Componentes Temp'),
        ),
        body: ListView(
          children: _crearItemsCorta(),
        ));
  }

  List<Widget> _crearItems() {
    List<Widget> listTemp = [];
    for (var opt in opciones) {
      final temp = ListTile(
        title: Text(opt),
      );
      listTemp..add(temp);
      listTemp.add(Divider());
    }
    return listTemp;
  }

  List<Widget> _crearItemsCorta() {
    final widgets = opciones.map((item) {
      return Column(
        children: [
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('subtitle ' + item),
          ),
          Divider()
        ],
      );
    }).toList();
    return widgets;
  }
}
