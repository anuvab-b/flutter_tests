import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/presentation/counter_screen.dart';

void main() {
  testWidgets(
      "Given Counter is 0 when button is clicked then counter should be 1",
      (widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(home: CounterScreen()));
    final counter = find.text("0");
    expect(counter, findsNWidgets(1));

    final counter1 = find.text("1");
    expect(counter1, findsNothing);

    final incrementButton = find.byKey(const Key("increment_counter"));
    await widgetTester.tap(incrementButton);

    // setState(){}
    await widgetTester.pump();

    final counter2 = find.text("1");
    expect(counter2, findsOneWidget);

    final counter3 = find.text("0");
    expect(counter3, findsNothing);
    
    expect(find.byType(AppBar), findsOneWidget);
  });
}
