import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
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

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 5},
        {'texto': 'Vermelho', 'pontuacao': 3},
        {'texto': 'Verde', 'pontuacao': 10},
        {'texto': 'Branco', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coala', 'pontuacao': 5},
        {'texto': 'Elefante', 'pontuacao': 3},
        {'texto': 'Gato', 'pontuacao': 10},
        {'texto': 'Cachorro', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Saturnino', 'pontuacao': 5},
        {'texto': 'Josinaldo', 'pontuacao': 3},
        {'texto': 'Donizildo', 'pontuacao': 10},
        {'texto': 'Emeterio', 'pontuacao': 1},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    /*for (String textoResposta in respostas) {
      widgets.add(Resposta(textoResposta, _responder));
    }*/
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
                perguntas: _perguntas,
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
