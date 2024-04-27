import 'package:flutter/material.dart';
import 'package:flutter_components/src/pages/alert_page.dart';

import 'package:flutter_components/src/providers/menu_providers.dart';
import 'package:flutter_components/src/utils/icon_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _crearLista(),
    );
  }

  FutureBuilder<List> _crearLista() {
    return FutureBuilder(
        future: menuProvider.cargarData(),
        initialData: [],
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return ListView(
            children: _listaItems(snapshot.data),
          );
        });
  }

  List<Widget> _listaItems(data) {
    final List<Widget> opciones = [];
    data.forEach((element) {
      final widgetTemp = ListTile(
        title: Text(element['texto']),
        subtitle: Text(element['texto'] + ' !!!'),
        trailing: Icon(Icons.arrow_forward_ios),
        leading: getIcons(element['icon']),
        onTap: () {
          Navigator.pushNamed(context, element['ruta']);
        },
      );
      opciones.add(widgetTemp);
      opciones.add(Divider());
    });
    return opciones;
  }
}
