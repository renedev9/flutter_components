import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          }),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (_) => _menuAlertDialog(context));
          },
          child: Text('Show Alert'),
          style: ElevatedButton.styleFrom(primary: Colors.red),
        ),
      ),
    );
  }

  _menuAlertDialog(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 40,
      title: Text('Titulo del dialogo'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Este es el contenido del Alert Dialog'),
          SizedBox(
            height: 20,
          ),
          FlutterLogo(
            size: 100,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Ok'),
        )
      ],
    );
  }
}
