import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nem_a_pato_app/model/question.dart';
import 'package:nem_a_pato_app/pages/select_game_mode_page.dart';
import 'package:nem_a_pato_app/service/data_service.dart';

class GamePage extends StatefulWidget {
  final int matches;

  const GamePage({
    super.key,
    required this.matches,
  });

  @override
  GamePageState createState() => GamePageState();
}

class GamePageState extends State<GamePage> {
  String theme = "";
  String question = "";
  int answer = 0;
  bool answerRevealed = false;
  List<String> indexesQuestionsGoneList = [];
  final DataService dataService = DataService();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    Random random = Random();
    int themeIndex = random.nextInt(21);
    int questionIndex = random.nextInt(5);
    String indexString = themeIndex.toString() + questionIndex.toString();
    List<String> indexesDone = indexesQuestionsGoneList;

    while (indexesDone.contains(indexString)) {
      themeIndex = random.nextInt(21);
      questionIndex = random.nextInt(5);
      indexString = themeIndex.toString() + questionIndex.toString();
    }

    indexesDone.add(indexString);
    Question questionLoaded = await dataService.loadQuestionByThemeAndQuestionIndex(themeIndex, questionIndex);

    setState(() {
      theme = questionLoaded.theme;
      question = questionLoaded.question;
      answer = questionLoaded.answer;
      indexesQuestionsGoneList = indexesDone;
    });
  }

  void showAnswer() {
    setState(() {
      answerRevealed = true;
    });
  }

  void loadNextQuestion() {
    loadData();
    setState(() {
      answerRevealed = false;
    });
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
                      ? Align(
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
                    loadNextQuestion();
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
