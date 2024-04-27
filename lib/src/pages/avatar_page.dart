import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: [
          CircleAvatar(
            child: Text('SL'),
            backgroundColor: Colors.green,
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://www.movilzona.es/app/uploads-movilzona.es/2019/05/Foto-de-Perfil-en-WhatsApp.jpg'),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          }),
      body: Center(
        child: FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(
                'https://astelus.com/wp-content/viajes/Lago-Moraine-Parque-Nacional-Banff-Alberta-Canada.jpg'), //
            fadeInDuration: Duration(milliseconds: 2000)),
      ),
    );
  }
}
