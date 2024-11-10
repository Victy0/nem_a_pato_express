import 'package:flutter/material.dart';
import 'package:nem_a_pato_app/pages/game_page.dart';

class DialogPlayerNumber extends StatefulWidget {
  const DialogPlayerNumber({super.key});

  @override
  NumberPickerDialogState createState() => NumberPickerDialogState();
}

class NumberPickerDialogState extends State<DialogPlayerNumber> {
  int playersNumber = 2;

  void increaseValue() {
    setState(() {
      playersNumber++;
    });
  }

  void decreaseValue() {
    setState(() {
      playersNumber--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center( 
        child: Text(
          "Informe o número de jogadores:",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: playersNumber == 2 ? null : decreaseValue,
                icon: const Icon(
                  Icons.remove,
                  size: 40,
                  color: Colors.red,
                ),
              ),
              const SizedBox(width: 20),
              Text(
                '$playersNumber',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 20),
              IconButton(
                onPressed: playersNumber == 20 ? null : increaseValue,
                icon: const Icon(
                  Icons.add,
                  size: 40,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Desistir',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GamePage(matches: playersNumber)),
                );
              },
              child: const Text(
                'Começar',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}