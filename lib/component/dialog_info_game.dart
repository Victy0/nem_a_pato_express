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
              'Nem a Pato!',
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
                  'Neste jogo, o importante não é saber a resposta, você só precisa chutar um número.\nSó não exagere, pois alguém pode dizer “Nem a pato!” e desafiar seu palpite.\n\nEm cada rodada de Nem a Pato!, uma pergunta é selecionada e lida em voz alta, e cada jogador tentará adivinhar a resposta numérica em seu turno. Se um palpite for contestado, a resposta é verificada. Se a resposta estiver certa, você continua no jogo. Se a resposta estiver errada, você sai do jogo.\nNo final da partida, o último jogador vence!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text(
                'OK',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
      icon: Image.asset(
        "assets/images/question_icon.png", 
        height: 33,
      ),
    );
  }
}