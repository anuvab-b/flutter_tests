import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/presentation/animation_screen.dart';

void main() {
  testWidgets("Animation Screen Test", (widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(home: AnimationScreen()));

    var containerFinder = find.byType(Container);
    expect(containerFinder, findsOneWidget);
    var container = widgetTester.widget<Container>(containerFinder);


    expect(container.constraints!.minWidth,50);
    expect(container.constraints!.minHeight,50);
    expect((container.decoration as BoxDecoration).color,Colors.blue);
    expect((container.decoration as BoxDecoration).borderRadius, BorderRadius.zero);

    await widgetTester.pumpAndSettle();
    containerFinder = find.byType(Container);
    container = widgetTester.widget<Container>(containerFinder);

    expect(container.constraints!.minWidth, 200);
    expect(container.constraints!.minHeight, 200);
    expect((container.decoration as BoxDecoration).color, Colors.green);
    expect(
      (container.decoration as BoxDecoration).borderRadius,
      BorderRadius.circular(50),
    );
  });
}
