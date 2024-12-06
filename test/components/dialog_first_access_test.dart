import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nem_a_pato_app/components/dialog_first_access.dart';

void main() {
  testWidgets('DialogFirstAccess widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DialogFirstAccess(),
        ),
      ),
    );

    expect(find.text('Bem-vindo!'), findsOneWidget);
    expect(find.text(
      'O app "Nem a Pato! express" é uma versão adaptada e simplificada do jogo de cartas, estratégia e trívia "Nem a pato!", inventado por Rodrigo Rego e disponibilizado pela Grok Games no Brasil.\n\nCaso goste do jogo, queira jogar partidas mais complexas e com maiores desafios ou ter uma cópia física do jogo, é aconselhável a aquisição do jogo "Nem a pato!".',
    ), findsOneWidget);
    expect(find.text('OK!'), findsOneWidget);

    // close dialog
    await tester.tap(find.text('OK!'));
    await tester.pumpAndSettle();
    expect(find.text('Bem-vindo!'), findsNothing);
  });
}
