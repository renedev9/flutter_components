import 'dart:math';

import 'package:flutter/material.dart';

class Inputs_Page extends StatefulWidget {
  Inputs_Page({super.key});

  @override
  State<Inputs_Page> createState() => _Inputs_PageState();
}

class _Inputs_PageState extends State<Inputs_Page> {
  TextEditingController controllerText = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerFecha = TextEditingController();
  String poder = 'Volar';

  List<String> poderes = ['Volar', ' Supersonico', 'Rayos X'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          _crearItems(),
          SizedBox(
            height: 20,
          ),
          _crearEmail(),
          SizedBox(
            height: 20,
          ),
          _crearPassword(),
          SizedBox(
            height: 20,
          ),
          _crearDateTime(),
          _crearDropdown(),
          Center(child: Text('Este es el text: ${controllerText.text}')),
          Center(child: Text('Este es el email: ${controllerEmail.text}')),
          Center(child: Text('Este es el pass: ${controllerPassword.text}'))
        ],
      ),
    );
  }

  _crearItems() {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        controller: controllerText,
        decoration: InputDecoration(
            label: Text('Nombre y apellidos'),
            icon: Icon(Icons.account_circle),
            helperText: 'Inserte el nombre',
            hintText: 'hintText',
            suffixIcon: Icon(
              Icons.upcoming_sharp,
            ),
            counter: Text('Counter: ${controllerText.text.length}'),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        onChanged: (value) {
          setState(() {
            value = controllerText.text;
          });
        },
      ),
    );
  }

  _crearPassword() {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: TextField(
        obscureText: true,
        //textCapitalization: TextCapitalization.sentences,
        controller: controllerPassword,
        decoration: InputDecoration(
          label: Text('Password'),
          icon: Icon(Icons.lock),
          helperText: 'Inserte el pass',
          hintText: 'hintText',
          suffixIcon: Icon(
            Icons.lock_open_outlined,
          ),
          counter: Text('Counter: ${controllerPassword.text.length}'),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onChanged: (value) {
          setState(() {
            value = controllerPassword.text;
          });
        },
      ),
    );
  }

  _crearEmail() {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        controller: controllerEmail,
        decoration: InputDecoration(
            label: Text('Email'),
            icon: Icon(Icons.email),
            helperText: 'Inserte el email',
            hintText: 'hintText',
            suffixIcon: Icon(Icons.alternate_email),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        onChanged: (value) {
          setState(() {
            value = controllerEmail.text;
          });
        },
      ),
    );
  }

  _crearDateTime() {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: TextField(
          textCapitalization: TextCapitalization.sentences,
          controller: controllerFecha,
          decoration: InputDecoration(
              label: Text('Fecha de Nacimiento'),
              icon: Icon(Icons.date_range),
              helperText: 'Inserte la fecha',
              hintText: 'hintText',
              suffixIcon: Icon(
                Icons.date_range_outlined,
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
            _selectDate();
          }),
    );
  }

  Future<DateTime> _selectDate() async {
    final picker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2025));
    if (picker != null) {
      setState(() {
        controllerFecha.text = picker.toString();
      });

      return picker;
    }
    return DateTime.now();
  }

  _crearDropdown() {
    return Row(children: [
      //Text(poder),
      DropdownButton(
          value: poder,
          items: _getOpcionesDropDown(),
          onChanged: (opt) {
            print(opt);
            setState(() {
              poder = opt.toString();
            });
          })
    ]);
  }

  List<DropdownMenuItem<String>> _getOpcionesDropDown() {
    List<DropdownMenuItem<String>> opciones = [];
    poderes.forEach((element) {
      opciones.add(DropdownMenuItem(
        child: Text(element),
        value: element,
      ));
    });
    return opciones;
  }
}
