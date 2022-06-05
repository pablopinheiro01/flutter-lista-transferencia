

import 'package:flutter/material.dart';

class Editor extends StatelessWidget {

  final TextEditingController controller;
  final String rotulo;
  final String dica;
  final IconData? icone;

  Editor({required this.controller, required this.rotulo,required this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          icon:  icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}