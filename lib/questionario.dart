import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;
  final List<Map<String, Object>>? perguntas;

  Questionario({
    required this.quandoResponder,
    required this.perguntaSelecionada,
    required this.perguntas,
  });

  bool get temPerguntaSelecionada {
    return perguntas != null && perguntaSelecionada < perguntas!.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas![perguntaSelecionada]['respostas']
              as List<Map<String, Object>>
        : [];
    return Column(
      children: [
        Questao(perguntas![perguntaSelecionada]['texto'].toString()),
        ...respostas
            .map(
              (r) => Resposta(
                r['texto'] as String,
                () => quandoResponder(r['pontuacao'] as int),
              ),
            )
            .toList(),
      ],
    );
  }
}
