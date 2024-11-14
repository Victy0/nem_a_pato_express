import 'package:flutter/material.dart';

class DialogInfoGame extends StatelessWidget {
  const DialogInfoGame({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Center( 
            child: Text(
              'Nem a Pato! Express',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          content: const SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Neste jogo, o importante não é saber a resposta, você só precisa chutar um número.\nSó não exagere, pois alguém pode dizer “Nem a pato!” e desafiar seu palpite.\n\nEm cada rodada, uma pergunta é selecionada e lida em voz alta, e cada jogador tentará adivinhar a resposta numérica em seu turno. Se um palpite for contestado, a resposta é verificada.\nSe o palpite for menor ou igual a resposta, o contestador sai do jogo. Mas se o palpite for maior que a resposta, você sai do jogo.\nNo final da partida, o último jogador vence!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "QUACK!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
      icon: Image.asset(
        "assets/images/question_icon.png", 
        height: 40,
      ),
    );
  }
}
