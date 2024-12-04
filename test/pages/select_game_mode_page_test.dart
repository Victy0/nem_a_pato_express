import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nem_a_pato_app/components/dialog_info_game.dart';
import 'package:nem_a_pato_app/pages/select_game_mode_page.dart';
import 'package:nem_a_pato_app/pages/initial_page.dart';

void main() {
  testWidgets('SelectGameModePage has correct UI and navigates correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SelectGameModePage()));

    // title
    expect(find.text('Escolha o modo de jogo:'), findsOneWidget);

    // game modes
    final aleatorioText = find.byWidgetPredicate((widget) => widget is Text && widget.data == 'ALEATÓRIO');
    final tematicoText = find.byWidgetPredicate((widget) => widget is Text && widget.data == 'TEMÁTICO');
    expect(aleatorioText, findsOneWidget);
    expect(tematicoText, findsOneWidget);

    // info game
    expect(find.byType(DialogInfoGame), findsOneWidget);

    // icon button appbar
    final iconButtonAppBar = find.byWidgetPredicate(
      (widget) =>
        widget is IconButton &&
        widget.icon is ClipRRect &&
        (widget.icon as ClipRRect).child is Image).first;
    await tester.tap(iconButtonAppBar);
    await tester.pumpAndSettle();
    expect(find.byType(InitialPage), findsOneWidget);
  });
}
