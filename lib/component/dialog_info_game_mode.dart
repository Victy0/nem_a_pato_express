import 'package:flutter/material.dart';

class DialogInfoGameMode extends StatelessWidget {
  final String title;
  final String content;

  const DialogInfoGameMode({
    super.key,
    required this.title,
    required this.content
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Center( 
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  content,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'QUACK!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
      icon: Image.asset(
        "assets/images/info.png", 
        height: 33,
      ),
    );
  }
}