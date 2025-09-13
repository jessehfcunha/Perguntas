import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';
import 'dados/perguntas.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < perguntas.length;
  }

  _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  _reiniciarQuestionario() => setState(() {
    _perguntaSelecionada = 0;
    _pontuacaoTotal = 0;
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          foregroundColor: Colors.white,
          title: Center(
            child: Text(
              "Perguntas",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
