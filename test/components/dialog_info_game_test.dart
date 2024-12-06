import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nem_a_pato_app/components/dialog_info_game.dart';

void main() {
  testWidgets('DialogInfoGame widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DialogInfoGame(),
        ),
      ),
    );

    expect(find.byType(IconButton), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);

    // click open dialog
    await tester.tap(find.byType(IconButton));
    await tester.pumpAndSettle();
    expect(find.text('Nem a Pato! Express'), findsOneWidget);
    expect(find.text(
      'Neste jogo, o importante não é saber a resposta, você só precisa chutar um número.\nSó não exagere, pois alguém pode dizer “Nem a pato!” e desafiar seu palpite.\n\nEm cada rodada, uma pergunta é selecionada e lida em voz alta, e cada jogador tentará adivinhar a resposta numérica em seu turno. Se um palpite for contestado, a resposta é verificada.\nSe o palpite for menor ou igual a resposta, o contestador sai do jogo. Mas se o palpite for maior que a resposta, você sai do jogo.\nNo final da partida, o último jogador vence!',
    ), findsOneWidget);
    expect(find.text('QUACK!'), findsOneWidget);

    // click 'QUACK!' button
    await tester.tap(find.text('QUACK!'));
    await tester.pumpAndSettle();
    expect(find.text('Nem a Pato! Express'), findsNothing);
  });
}
