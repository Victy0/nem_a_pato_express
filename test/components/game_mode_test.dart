import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nem_a_pato_app/components/dialog_players_number.dart';
import 'package:nem_a_pato_app/components/dialog_info_game_mode.dart';
import 'package:nem_a_pato_app/components/game_mode.dart';

void main() {
  testWidgets('GameMode widget renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: GameMode(
            modeName: 'mode',
            description: 'description',
            isActive: true,
          ),
        ),
      ),
    );

    expect(find.text('MODE'), findsOneWidget);
    expect(find.byType(IconButton), findsExactly(2));
    expect(find.byType(DialogInfoGameMode), findsOneWidget);

    // click select game
    await tester.tap(find.byType(IconButton).last);
    await tester.pumpAndSettle();
    expect(find.byType(DialogPlayerNumber), findsOneWidget);
  });

  testWidgets('GameMode widget renders correctly with isActive false', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: GameMode(
            modeName: 'mode',
            description: 'description',
            isActive: false,
          ),
        ),
      ),
    );

    expect(find.text('MODE'), findsOneWidget);
    expect(find.byType(IconButton), findsExactly(2));
    final iconButton = tester.widget<IconButton>(find.byType(IconButton).last);
    expect(iconButton.onPressed, isNotNull);
    final container = tester.widget<Container>(find.byType(Container).last);
    final decoration = container.decoration as BoxDecoration;
    expect(decoration.gradient!.colors.first, equals(const Color.fromARGB(255, 139, 139, 139)));
    expect(find.byType(DialogInfoGameMode), findsOneWidget);

    // click select game
    await tester.tap(find.byType(IconButton).last);
    await tester.pumpAndSettle();
    expect(find.byType(DialogPlayerNumber), findsNothing);
  });
}
