import 'package:flutter/material.dart';
import 'package:nem_a_pato_app/pages/select_game_page.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(244, 253, 219, 23),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SelectGamePage()),
          );
        },
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // icon 1
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SelectGamePage()),
                    );
                  },
                  icon: Image.asset(
                    "assets/images/nem_a_pato_logo.jpg",
                    height: 150,
                  ),
                ),
                // spacing
                const SizedBox(height: 20),
                // icon 2
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SelectGamePage()),
                    );
                  },
                  icon: Image.asset(
                    "assets/images/nem_a_pato_duck.jpg", 
                    height: 150,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
