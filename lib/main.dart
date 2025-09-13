import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': ['Cachorro', 'Gato', 'Coala', 'Elefante'],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': ['Donizildo', 'Josinaldo', 'Emetério', 'Saturnino'],
    },
  ];

  _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? (_perguntas[_perguntaSelecionada]['respostas'] as List<String>)
        : [];

    /*for (String textoResposta in respostas) {
      widgets.add(Resposta(textoResposta, _responder));
    }*/
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text("Perguntas"))),
        body: temPerguntaSelecionada
            ? Column(
                children: [
                  // Example: show the first person's name if available
                  Questao(_perguntas[_perguntaSelecionada]['texto'].toString()),
                  ...respostas.map((t) => Resposta(t, _responder)).toList(),
                ],
              )
            : Center(
                child: Text("Parabéns! Você respondeu todas as perguntas!"),
              ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
