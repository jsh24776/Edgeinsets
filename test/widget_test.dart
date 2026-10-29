// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:edgeinsets_demo/main.dart';

void main() {
  testWidgets('shows the four EdgeInsets examples without an app bar', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: EdgeInsetsDemo()));

    expect(find.byType(AppBar), findsNothing);
    expect(find.text('EdgeInsets.all(30)'), findsOneWidget);
    expect(
      find.text('EdgeInsets.symmetric(horizontal: 40, vertical: 10)'),
      findsOneWidget,
    );
    expect(
      find.text('EdgeInsets.only(left: 30, top: 10, right: 5, bottom: 20)'),
      findsOneWidget,
    );
    expect(find.text('EdgeInsets.fromLTRB(10, 20, 30, 40)'), findsOneWidget);

    final blueText = tester.widget<Text>(
      find.text('EdgeInsets.only(left: 30, top: 10, right: 5, bottom: 20)'),
    );
    expect(blueText.maxLines, 1);
    expect(blueText.softWrap, isFalse);

    final blueBox = tester.widget<Container>(
      find
          .ancestor(
            of: find.text(
              'EdgeInsets.only(left: 30, top: 10, right: 5, bottom: 20)',
            ),
            matching: find.byType(Container),
          )
          .first,
    );
    expect(blueBox.margin, const EdgeInsets.symmetric(horizontal: 15));

    final firstExample = tester.widget<Container>(
      find
          .ancestor(
            of: find.text('EdgeInsets.all(30)'),
            matching: find.byType(Container),
          )
          .first,
    );
    expect(firstExample.padding, const EdgeInsets.all(30));
    expect(firstExample.color, Colors.red);
  });
}
