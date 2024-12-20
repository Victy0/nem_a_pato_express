import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:nem_a_pato_app/components/dialog_first_access.dart';
import 'package:nem_a_pato_app/components/dialog_info_game.dart';
import 'package:nem_a_pato_app/components/version_app_info.dart';
import 'package:nem_a_pato_app/pages/select_game_mode_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  InitialPageState createState() => InitialPageState();
}

class InitialPageState extends State<InitialPage> {
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    player.play(AssetSource('sounds/quack-trail.mp3'));
    checkFirstAccess();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  Future<void> checkFirstAccess() async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstTime = prefs.getBool('isFirstAccess') ?? true;

    if (isFirstTime) {
      showFirstAccessDialog();
      prefs.setBool('isFirstAccess', false);
    }
  }

  Future<void> showFirstAccessDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) => const DialogFirstAccess(),
    );
  }

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      backgroundColor: const Color.fromARGB(244, 253, 219, 23),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 4,
                    ),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Icon 1
                      IconButton(
                        key: const Key('logo_icon_button'),
                        onPressed: () async {
                          player.play(AssetSource('sounds/quack.mp3'));
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SelectGameModePage()),
                          );
                        },
                        icon: Image.asset(
                          "assets/images/nem_a_pato_logo.jpg",
                          height: 250,
                        ),
                      ),
                      // Spacing
                      const SizedBox(height: 20),
                      // Icon 2
                      IconButton(
                        key: const Key('duck_icon_button'),
                        onPressed: () async {
                          player.play(AssetSource('sounds/quack.mp3'));
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SelectGameModePage()),
                          );
                        },
                        icon: Image.asset(
                          "assets/images/nem_a_pato_duck.jpg", 
                          height: 250,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: VersionAppInfo(),
            ),
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
