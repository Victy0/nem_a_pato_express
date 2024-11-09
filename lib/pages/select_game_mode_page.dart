import 'package:flutter/material.dart';
import 'package:nem_a_pato_app/component/dialog_info_game.dart';
import 'package:nem_a_pato_app/component/dialog_info_game_mode.dart';
import 'package:nem_a_pato_app/pages/game_page.dart';
import 'package:nem_a_pato_app/pages/initial_page.dart';

class SelectGameModePage extends StatelessWidget {
  const SelectGameModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InitialPage()),
              );
            },
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                "assets/images/nem_a_pato_duck.jpg",
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 237, 237),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(244, 253, 219, 23),
          ),
          const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Escolha o modo de jogo:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // choose 'ALEATORIO'
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const DialogInfoGameMode(title: "Modo Aleatório", content: "Nesse modo, a cada rodada é sorteada uma questão aleatória de um tema aleatório do acervo disponível.\n\nVocê possui a possibilidade de pular a questão caso haja necessário e tentar ser o último jogador presente ao fim da rodada."),
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
                      child: const Center(
                        child: Text(
                          "ALEATÓRIO",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Divider
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Divider(
                  color: Color.fromARGB(255, 0, 0, 0),
                  thickness: 3.0,
                  height: 20.0,
                ),
              ),
              // choose 'TEMATICO'
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const DialogInfoGameMode(title: "Modo Temático", content: "Em breve!"),
                  IconButton(
                    onPressed: () {
                      // ADICIONAR REDIRECIONAMENTO DE JOGO TEMÁTICO
                    },
                    icon: Container(
                      width: 300,
                      height: 60,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 139, 139, 139),
                            Color.fromARGB(255, 119, 119, 119)
                          ],
                        ),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          width: 3,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "TEMÁTICO",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: DialogInfoGame(),
            ),
          ),
        ],
      ),
    );
  }
}
