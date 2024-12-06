import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nem_a_pato_app/components/dialog_first_access.dart';
import 'package:nem_a_pato_app/components/dialog_info_game.dart';
import 'package:nem_a_pato_app/pages/initial_page.dart';
import 'package:nem_a_pato_app/pages/select_game_mode_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockAudioPlayer extends Mock implements AudioPlayer {
  @override
  Future<void> dispose() async {
    // Mock do dispose, retorna um Future<void>
    return Future.value();
  }
}

void main() {
  testWidgets('InitialPage has correct UI and navigates correctly on click logo icon', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: InitialPage()),
    );

    // info game
    expect(find.byType(DialogInfoGame), findsOneWidget);

    // icon button click and verify navigate
    final logoIconButton = find.byKey(const Key('logo_icon_button'));
    await tester.tap(logoIconButton);
    await tester.pumpAndSettle(const Duration(milliseconds: 50));
    expect(find.byType(SelectGameModePage), findsOneWidget);
  });

  testWidgets('InitialPage has correct UI and navigates correctly on click duck icon', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: InitialPage()),
    );

    // info game
    expect(find.byType(DialogInfoGame), findsOneWidget);

    // icon button click and verify navigate
    final duckIconButton = find.byKey(const Key('duck_icon_button'));
    await tester.tap(duckIconButton);
    await tester.pumpAndSettle(const Duration(milliseconds: 50));
    expect(find.byType(SelectGameModePage), findsOneWidget);
  });

  testWidgets('Test click to show DialogInfoGame', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: InitialPage()),
    );

    // info game
    final dialogInfoGameButton = find.byType(DialogInfoGame);
    expect(dialogInfoGameButton, findsOneWidget);

    // click to show info game
    await tester.tap(dialogInfoGameButton);
    await tester.pumpAndSettle(const Duration(milliseconds: 50));
    expect(find.text('Nem a Pato! Express'), findsOneWidget);
  });


  testWidgets('Test first access dialog is shown', (WidgetTester tester) async {
    // SharedPreferences mock to show dialog
    SharedPreferences.setMockInitialValues({});
    
    await tester.pumpWidget(
      const MaterialApp(home: InitialPage()),
    );
    await tester.pumpAndSettle();

    // verify dialog
    expect(find.byType(DialogFirstAccess), findsOneWidget);
  });

  testWidgets('Test first access dialog is not shown when is not first access', (WidgetTester tester) async {
    // SharedPreferences mock to not show dialog
    SharedPreferences.setMockInitialValues({'isFirstAccess': false});
    
    await tester.pumpWidget(
      const MaterialApp(home: InitialPage()),
    );
    await tester.pumpAndSettle();

    // verify dialog
    expect(find.byType(DialogFirstAccess), findsNothing);
  });
}