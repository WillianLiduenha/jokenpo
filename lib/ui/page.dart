import 'dart:math';
import 'package:flutter/material.dart';

class Jokenpo extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Jokenpo> {
  final TextEditingController txtPesoCtrl = TextEditingController();
  final TextEditingController txtAlturaCtrl = TextEditingController();

  String image_pc = "assets/images/pc.png";
  String image_humano = "assets/images/humano.jpeg";
  String vencedor= "Escolha uma opção!";
  int numero = 0;
  int vitoria = 0;
  int derrota = 0;

  void definirImagens(int escolha) {
    if (escolha == 0) {
      image_humano = "assets/images/preda.jpeg";
    } else if (escolha == 1) {
      image_humano = "assets/images/papel.jpeg";
    } else {
      image_humano = "assets/images/tesoura.jpeg";
    }

    if (numero == 0) {
      image_pc = "assets/images/preda.jpeg";
    } else if (numero == 1) {
      image_pc = "assets/images/papel.jpeg";
    } else {
      image_pc = "assets/images/tesoura.jpeg";
    }
  }

  void ganhador(int escolha) {
    var r = Random();
    numero = r.nextInt(3);
    print(numero);

    // pedra = 0
    // papel = 1
    // tesoura = 2

    if (escolha == numero) {
//empate
      vencedor = "Houve um empate!";
    } else if (escolha == 0 && numero == 1 ||
        escolha == 1 && numero == 2 ||
        escolha == 2 && numero == 0) {
//humano perdeu
      vencedor = "Você perdeu!!";
      derrota++;
    } else {
//humano ganhou
      vencedor = "Você ganhou";
      vitoria++;
    }
    definirImagens(escolha);
    setState(() {});
  }

  double imc = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Jo-ken-po'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                child: Row(children: [
                  Flexible(child: Text("O computador ganhou ${derrota} vezes")),
                  SizedBox(width: 20),
                  Flexible(child: Text("Você ganhou ${vitoria} vezes")),
                ]),
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                child: Row(children: [
                  Flexible(child: Center(child: Image.asset(image_pc))),
                  Flexible(child: Center(child: Image.asset(image_humano))),
                ]),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: ElevatedButton(
                        child: Text(
                          "Pedra",
                          style: TextStyle(color: Colors.purple, fontSize: 16),
                        ),
                        onPressed: () => ganhador(0),
                      ),
                    ),
                    Flexible(
                      child: ElevatedButton(
                        child: Text(
                          "Papel",
                          style: TextStyle(color: Colors.purple, fontSize: 16),
                        ),
                        onPressed: () => ganhador(1),
                      ),
                    ),
                    Flexible(
                      child: ElevatedButton(
                        child: Text(
                          "Tesoura",
                          style: TextStyle(color: Colors.purple, fontSize: 16),
                        ),
                        onPressed: () => ganhador(2),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text("${vencedor}")
          ],
        ),
      ),
    );
  }
}
