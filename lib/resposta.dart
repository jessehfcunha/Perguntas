import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final VoidCallback filho;
  Resposta(this.texto, this.filho);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: (Colors.redAccent),
          foregroundColor: (Colors.white),
        ),
        child: Text(texto),
        onPressed: filho,
      ),
    );
  }
}
