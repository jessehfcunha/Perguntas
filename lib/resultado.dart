import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciarQuestrionario;

  Resultado(this.pontuacao, this.reiniciarQuestrionario);

  String get fraseResultado {
    if (pontuacao < 8) {
      return "Parabéns!";
    } else if (pontuacao < 12) {
      return "Você é bom!";
    } else if (pontuacao < 16) {
      return "Impressionante!";
    } else {
      return "Nível Mestre Jedi!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber[50],
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            fraseResultado,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
            ),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: (Colors.blueAccent),
              foregroundColor: (Colors.white),
            ),
            child: Text("Reiniciar Questionário"),
            onPressed: reiniciarQuestrionario,
          ),
        ],
      ),
    );
  }
}
