import 'package:flutter/material.dart';

class Page404 extends StatelessWidget {
  const Page404({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text('404',
                  style: TextStyle(color: Colors.blue, fontSize: 50))),
          Text(
            'Pagina en Trabajo',
            style: TextStyle(color: Colors.blue),
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Regresar',
                style: TextStyle(color: Colors.red),
              )),
        ],
      ),
    );
  }
}
