import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  bool _loading = false;
  @override
  void initState() {
    super.initState();
    //el initState se lanza primero lo que hace que se agreguen los diez elementos al cargar la pagina
    _agregar10();
    //De esta manera el controlador escucha los cambios
    _scrollController.addListener(() {
      // agregar mas al final de la lista
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //es decir la utlima posicion de la lista, al final
        _crearTimer();
        //_agregar10();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  ScrollController _scrollController = ScrollController();
  List<int> li = [];
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas y Scroll'),
      ),
      body: Stack(children: [
        RefreshIndicator(
          //esto es para representar en la vista el pull to refresh
          onRefresh: _pullToRefresh,
          child: ListView.builder(
            controller: _scrollController,
            itemBuilder: (BuildContext context, int index) {
              final image = li[index];
              return FadeInImage(
                  // height: 200,
                  //width: 200,
                  fadeInDuration: Duration(milliseconds: 500),
                  placeholder: AssetImage('assets/zi0s9iygbj85ltlz98e0.gif'),
                  image: NetworkImage(
                      'https://picsum.photos/500/300?random=$image'));
            },
            itemCount: li.length,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _cargarData(),
              ],
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ]),
    );
  }

  void _agregar10() {
    for (var i = 0; i < 10; i++) {
      _count++;
      li.add(_count);
      setState(() {});
    }
  }

////////timer para simular tiempo de peticion http//////////
  _crearTimer() {
    _loading = true;
    setState(() {});

    Duration duration = Duration(seconds: 2);
    return Timer(duration, _respuestaHTTP);
  }

  _respuestaHTTP() {
    _loading = false;

    /// animatedto: es para subir 100 pixeles partiendo de la ultima posicion el scroll, seria la ultima de la lista en este caso
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 250));
    _agregar10();
    setState(() {});
  }

  Widget _cargarData() {
    if (_loading == true) {
      return CircularProgressIndicator();
    }
    return Container();
  }

  //////////Pull to Refresh//////////////////
  Future<Null> _pullToRefresh() {
    final duration = Duration(seconds: 2);
    new Timer(duration, () {
      _count++;
      li.clear();
      _agregar10();
    });
    return Future.delayed(duration);
  }
}
