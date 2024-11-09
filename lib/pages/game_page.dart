import 'package:flutter/material.dart';
import 'package:nem_a_pato_app/pages/select_game_page.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(244, 253, 219, 23),
          ),
          Center(
            child: Container(
              width: 350,
              height: 650,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // Text theme
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Tema',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    color: Color.fromARGB(255, 0, 0, 0),
                    thickness: 3.0,
                    indent: 50.0,
                    endIndent: 50.0,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text question
                        const Text(
                          'Frase aqui',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        const SizedBox(height: 30),
                        // Icon reveal
                        IconButton(
                          onPressed: () {
                            // ADICIONAR REDIRECIONAMENTO PARA PULAR
                          },
                          icon: Container(
                            width: 250,
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(244, 253, 219, 23),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                width: 3,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "RESPOSTA",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SelectGamePage()),
                );
                },
                icon: Image.asset(
                  "assets/images/exit.png",
                  height: 50,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconButton(
                onPressed: () {
                  // AÇÃO DE PULAR
                },
                icon: Image.asset(
                  "assets/images/jump.png",
                  height: 50,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
