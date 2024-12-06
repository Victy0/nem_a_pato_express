import 'package:flutter/material.dart';

class DialogFirstAccess extends StatefulWidget {
  const DialogFirstAccess({super.key});

  @override
  DialogFirstAccessState createState() => DialogFirstAccessState();
}

class DialogFirstAccessState extends State<DialogFirstAccess> {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center( 
        child: Text(
          'Bem-vindo!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),  
        ),
      ),
      content: const SingleChildScrollView ( 
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'O app "Nem a Pato! express" é uma versão adaptada e simplificada do jogo de cartas, estratégia e trívia "Nem a pato!", inventado por Rodrigo Rego e disponibilizado pela Grok Games no Brasil.\n\nCaso goste do jogo, queira jogar partidas mais complexas e com maiores desafios ou ter uma cópia física do jogo, é aconselhável a aquisição do jogo "Nem a pato!".',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ]
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            "OK!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}