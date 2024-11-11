import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:nem_a_pato_app/model/question.dart';
import 'package:nem_a_pato_app/pages/select_game_mode_page.dart';
import 'package:nem_a_pato_app/service/data_service.dart';

class GamePage extends StatefulWidget {
  final int totalMatches;

  const GamePage({
    super.key,
    required this.totalMatches,
  });

  @override
  GamePageState createState() => GamePageState();
}

class GamePageState extends State<GamePage> {
  final DataService dataService = DataService();
  final player = AudioPlayer();
  int themeNumber = 0;
  String theme = "";
  String question = "";
  int answer = 0;
  bool answerRevealed = false;
  int currentMatch = 1;
  List<String> indexesQuestionsGoneList = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    int themeNumberLoaded = themeNumber;
    if(themeNumberLoaded == 0) {
      themeNumberLoaded = await dataService.loadThemeQuantity();
    }
    Random random = Random();
    int themeIndex = random.nextInt(themeNumberLoaded);
    int questionIndex = random.nextInt(5);
    String indexString = themeIndex.toString() + questionIndex.toString();
    List<String> indexesDone = indexesQuestionsGoneList;

    while (indexesDone.contains(indexString)) {
      themeIndex = random.nextInt(themeNumberLoaded);
      questionIndex = random.nextInt(5);
      indexString = themeIndex.toString() + questionIndex.toString();
    }

    indexesDone.add(indexString);
    Question questionLoaded = await dataService.loadQuestionByThemeAndQuestionIndex(themeIndex, questionIndex);

    setState(() {
      themeNumber = themeNumberLoaded;
      theme = questionLoaded.theme;
      question = questionLoaded.question;
      answer = questionLoaded.answer;
      indexesQuestionsGoneList = indexesDone;
    });
  }

  void showAnswer() async {
    await player.play(AssetSource('sounds/quack.mp3'));
    Future.delayed(const Duration(milliseconds: 20), () {
      setState(() {
        answerRevealed = true;
      });
    });
  }

  void loadNextQuestion() {
    if(currentMatch == widget.totalMatches) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SelectGameModePage()),
      );
    }
    loadData();
    setState(() {
      answerRevealed = false;
      currentMatch++;
    });
  }

  void jumpQuestion() {
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(244, 253, 219, 23),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
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
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        theme,
                        style: const TextStyle(
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
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              question,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            const SizedBox(height: 30),
                            answerRevealed 
                              ? Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  answer.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                  ),
                                ),
                              )
                              : IconButton(
                                onPressed: () {
                                  showAnswer();
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
                            // condictional end
                          ],
                        ),
                      ),
                    ),
                    answerRevealed
                      ? currentMatch == widget.totalMatches
                        ? const Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                "FIM DE JOGO!",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Color.fromARGB(255, 253, 42, 42)
                                ),
                              )
                            ),
                          )
                        : Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: IconButton(
                                onPressed: () {
                                  loadNextQuestion();
                                },
                                icon: Image.asset(
                                  "assets/images/continue.png",
                                  height: 55,
                                ),
                              ),
                            ),
                          )
                        // condictional end
                      : Container()
                    // condictional end
                  ],
                ),
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
                    MaterialPageRoute(builder: (context) => const SelectGameModePage()),
                  );
                },
                icon: Image.asset(
                  "assets/images/exit.png",
                  height: 70,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconButton(
                onPressed: answerRevealed
                  ? null
                  : () {
                    jumpQuestion();
                  },
                icon: Image.asset(
                  "assets/images/jump.png",
                  height: 70,
                  opacity: answerRevealed ? const AlwaysStoppedAnimation(.5) : const AlwaysStoppedAnimation(1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
