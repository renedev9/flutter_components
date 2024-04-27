import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page'),
      ),
      body: ListView(padding: EdgeInsets.all(10), children: [
        _getCardUno(),
        SizedBox(
          height: 20,
        ),
        _getCardDos()
      ]),
    );
  }

  Widget _getCardUno() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      elevation: 20.0,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text('Soy el titulo de esta tarjeta'),
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            subtitle: Text(
                'Aqui estamos con la descripcion de la tarjeta que quiero que ustedes vean para tener una idea de lo que quiero mostrarles'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  /* style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(Colors.white)), */
                  onPressed: () {},
                  child: Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.black),
                  )),
              TextButton(
                  /* style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(Colors.white)), */
                  onPressed: () {},
                  child: Text(
                    'Ok',
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          )
        ],
      ),
    );
  }

  _getCardDos() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black,
                blurRadius: 20.0,
                spreadRadius: 2.0,
                offset: Offset(0, 10)),
          ],
          borderRadius: BorderRadius.circular(30.0)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Column(
          children: [
            FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image: NetworkImage(
                  'https://astelus.com/wp-content/viajes/Lago-Moraine-Parque-Nacional-Banff-Alberta-Canada.jpg'), //
              fadeInDuration: Duration(milliseconds: 2000),
              height: 250,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text('No tengo idea de que poner'),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
