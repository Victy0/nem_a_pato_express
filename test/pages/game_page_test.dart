import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nem_a_pato_app/pages/game_page.dart';
import 'package:nem_a_pato_app/pages/select_game_mode_page.dart';

void main() {
  testWidgets('GamePage initializes with correct totalMatches', (WidgetTester tester) async {
    const totalMatches = 5;

    await tester.pumpWidget(
      const MaterialApp(
        home: GamePage(totalMatches: totalMatches),
      ),
    );

    expect(find.byType(GamePage), findsOneWidget);
    expect(find.text('RESPOSTA'), findsOneWidget);
    expect(find.byType(Text), findsExactly(3)); // theme, question, answer
    expect(find.byType(IconButton), findsExactly(3)); //exit, jump, show answer
  });

  testWidgets('GamePage shows answer when button is pressed', (WidgetTester tester) async {
    const totalMatches = 3;

    await tester.pumpWidget(
      const MaterialApp(
        home: GamePage(totalMatches: totalMatches),
      ),
    );

    // click show answer
    expect(find.text('RESPOSTA'), findsOneWidget);
    await tester.tap(find.text('RESPOSTA'));
    await tester.pumpAndSettle(const Duration(milliseconds: 50));
    expect(find.byKey(const Key('answer')), findsOneWidget);
    expect(find.byKey(const Key('next')), findsOneWidget);
  });

  testWidgets('GamePage advances to next question after revealing answer', (WidgetTester tester) async {
    const totalMatches = 3;

    await tester.pumpWidget(
      const MaterialApp(
        home: GamePage(totalMatches: totalMatches),
      ),
    );

    // click show answer
    await tester.tap(find.text('RESPOSTA'));
    await tester.pumpAndSettle(const Duration(milliseconds: 50));
    expect(find.text('RESPOSTA'), findsNothing);
    expect(find.byKey(const Key('answer')), findsOneWidget);

    // Verifica se o botão de continuar (avançar) está visível
    await tester.tap(find.byKey(const Key('next')));
    await tester.pumpAndSettle(const Duration(milliseconds: 50));
    expect(find.text('RESPOSTA'), findsOneWidget);
    expect(find.byKey(const Key('answer')), findsNothing);
  });

  testWidgets('GamePage navigates to SelectGameModePage when "exit" button is pressed', (WidgetTester tester) async {
    const totalMatches = 3;
    await tester.pumpWidget(
      const MaterialApp(
        home: GamePage(totalMatches: totalMatches),
      ),
    );

    // click exit button
    await tester.tap(find.byKey(const Key('exit')));
    await tester.pumpAndSettle();
    expect(find.byType(SelectGameModePage), findsOneWidget);
  });

  testWidgets('GamePage shows new question when "jump" button is pressed', (WidgetTester tester) async {
    const totalMatches = 3;
    await tester.pumpWidget(
      const MaterialApp(
        home: GamePage(totalMatches: totalMatches),
      ),
    );
    var question1 = find.byType(Text).at(1);

    // click jump button
    await tester.tap(find.byKey(const Key('jump')));
    await tester.pumpAndSettle();
    expect(find.text('RESPOSTA'), findsOneWidget);
    var question2 = find.byType(Text).at(1);
    expect(question1, isNot(equals(question2)));
  });

  testWidgets('GamePage navigates to SelectGameModePage when "end game" button is pressed', (WidgetTester tester) async {
    const totalMatches = 1;
    await tester.pumpWidget(
      const MaterialApp(
        home: GamePage(totalMatches: totalMatches),
      ),
    );

    // click jump button
    await tester.tap(find.text('RESPOSTA'));
    await tester.pumpAndSettle(const Duration(milliseconds: 50));
    expect(find.byKey(const Key('end game')), findsOneWidget);

    // click end game button
    await tester.tap(find.byKey(const Key('end game')));
    await tester.pumpAndSettle();
    expect(find.byType(SelectGameModePage), findsOneWidget);
  });
}