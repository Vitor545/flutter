import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(FrasesDoDia());
}

class FrasesDoDia extends StatefulWidget {
  FrasesDoDia({super.key});

  List<String> frases = [
    "Gratidão não é pagamento, mas um reconhecimento que se demostra no dia a dia.",
    "A nível organizacional, o aumento do diálogo entre os diferentes setores produtivos aponta para a melhoria do remanejamento dos quadros funcionais.",
    "Percebemos, cada vez mais, que a execução dos pontos do programa obstaculiza a apreciação da importância dos métodos utilizados na avaliação de resultados.",
    "O cuidado em identificar pontos críticos na hegemonia do ambiente político estende o alcance e a importância do investimento em reciclagem técnica.",
    "Caros amigos, o desafiador cenário globalizado deve passar por modificações independentemente dos índices pretendidos.",
    "É importante questionar o quanto o aumento do diálogo entre os diferentes setores produtivos promove a alavancagem do sistema de participação geral."
  ];
  int number = Random().nextInt(6);

  @override
  State<FrasesDoDia> createState() => _FrasesDoDiaState();
}

class _FrasesDoDiaState extends State<FrasesDoDia> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Frases do Dia"),
          backgroundColor: Colors.green,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                  "https://www.42frases.com.br/wp-content/uploads/2022/08/frase-do-dia.png"),
              Text(
                widget.frases[widget.number],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.number = Random().nextInt(6);
                  });
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green)),
                child: const Text("Nova Frase"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
