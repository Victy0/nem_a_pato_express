import 'package:flutter/material.dart';
import 'package:nem_a_pato_app/pages/game_page.dart';
import 'package:nem_a_pato_app/component/dialog_info_game_mode.dart';

class GameMode extends StatelessWidget {
  final String modeName;
  final String description;

  const GameMode({
    super.key,
    required this.modeName,
    required this.description
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DialogInfoGameMode(title: "Modo $modeName", content: description),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const GamePage()),
            );
          },
          icon: Container(
            width: 300,
            height: 60,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 255, 254, 254),
                  Color.fromARGB(255, 238, 238, 238)
                ],
              ),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: const Color.fromARGB(255, 0, 0, 0),
                width: 3,
              ),
            ),
            child: Center(
              child: Text(
                modeName.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}