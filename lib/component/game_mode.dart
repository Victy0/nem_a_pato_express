import 'package:flutter/material.dart';
import 'package:nem_a_pato_app/pages/game_page.dart';
import 'package:nem_a_pato_app/component/dialog_info_game_mode.dart';

class GameMode extends StatelessWidget {
  final String modeName;
  final String description;
  final bool isActive;

  const GameMode({
    super.key,
    required this.modeName,
    required this.isActive,
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
            isActive
              ? Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GamePage()),
                )
              : null;
          },
          icon: Container(
            width: 300,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: isActive 
                  ? [
                      const Color.fromARGB(255, 255, 254, 254),
                      const Color.fromARGB(255, 238, 238, 238)
                    ]
                  : [
                      const Color.fromARGB(255, 139, 139, 139),
                      const Color.fromARGB(255, 119, 119, 119)
                    ]
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