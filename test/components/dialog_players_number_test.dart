import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nem_a_pato_app/components/dialog_players_number.dart';
import 'package:nem_a_pato_app/pages/game_page.dart';

void main() {
  testWidgets('DialogPlayerNumber widget test to start the game', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DialogPlayerNumber(),
        ),
      ),
    );

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text("Informe o número de jogadores:"), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.byIcon(Icons.remove), findsOneWidget);

    // click add button
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle(const Duration(milliseconds: 50));
    expect(find.text('3'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);

    // click remove button
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pumpAndSettle(const Duration(milliseconds: 50));
    expect(find.text('2'), findsOneWidget);

    // click 'COMEÇAR' button
    await tester.tap(find.text('COMEÇAR'));
    await tester.pumpAndSettle();
    expect(find.byType(GamePage), findsOneWidget);
  });

  testWidgets('DialogPlayerNumber widget test to to give up the game', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DialogPlayerNumber(),
        ),
      ),
    );

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text("Informe o número de jogadores:"), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.byIcon(Icons.remove), findsOneWidget);

    // click 'DESISTIR' button
    await tester.tap(find.text('DESISTIR'));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsNothing);
  });
}
