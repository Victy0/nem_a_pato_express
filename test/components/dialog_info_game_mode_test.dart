import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nem_a_pato_app/components/dialog_info_game_mode.dart';

void main() {
  testWidgets('DialogInfoGameMode widget test', (WidgetTester tester) async {
    const String title = 'title';
    const String content = 'content';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DialogInfoGameMode(
            title: title,
            content: content,
          ),
        ),
      ),
    );

    expect(find.byType(IconButton), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);

    // click show dialog
    await tester.tap(find.byType(IconButton));
    await tester.pumpAndSettle();
    expect(find.text(title), findsOneWidget);
    expect(find.text(content), findsOneWidget);
    expect(find.text('QUACK!'), findsOneWidget);

    // click 'QUACK! button
    await tester.tap(find.text('QUACK!'));
    await tester.pumpAndSettle();
    expect(find.text(title), findsNothing);
  });
}