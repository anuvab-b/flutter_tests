import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/presentation/home_page.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_tests/main.dart' as app;
void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("E2E Test", () {
    testWidgets("Verify Login Screen with correct credentials and proceed to Animation Screen", (widgetTester)async{
      app.main();
      await widgetTester.pumpAndSettle();

      await widgetTester.enterText(find.byType(TextFormField).at(0), "username");
      await widgetTester.enterText(find.byType(TextFormField).at(1), "password");

      await widgetTester.tap(find.byType(ElevatedButton));

      // For transition
      await widgetTester.pumpAndSettle();

      await Future.delayed(const Duration(seconds: 2));
      expect(find.byType(MyHomePage),findsOneWidget);

      final animation = find.byType(TextButton).at(2);
      await widgetTester.tap(animation);

      await widgetTester.pumpAndSettle();

      var containerFinder = find.byType(Container);
      expect(containerFinder, findsOneWidget);
      var container = widgetTester.widget<Container>(containerFinder);

      expect(container.constraints?.minWidth,200);
      expect(container.constraints?.minHeight,200);
      expect((container.decoration as BoxDecoration).color,Colors.green);
      expect((container.decoration as BoxDecoration).borderRadius, BorderRadius.circular(50));

    });

    testWidgets("Verify Login Screen with correct credentials and proceed to Counter Screen", (widgetTester)async{
      app.main();
      await widgetTester.pumpAndSettle();

      await widgetTester.enterText(find.byType(TextFormField).at(0), "username");
      await widgetTester.enterText(find.byType(TextFormField).at(1), "password");

      await widgetTester.tap(find.byType(ElevatedButton));

      // For transition
      await widgetTester.pumpAndSettle();

      await Future.delayed(const Duration(seconds: 2));
      expect(find.byType(MyHomePage),findsOneWidget);

      final counterButton = find.byType(TextButton).at(0);
      await widgetTester.tap(counterButton);

      await widgetTester.pumpAndSettle();

      var fabFinder = find.byType(FloatingActionButton).at(0);
      expect(fabFinder, findsNWidgets(1));
      var fab = widgetTester.widget<FloatingActionButton>(fabFinder);

      expect(fab.child, isA<Icon>());

      final counter = find.text("0");
      expect(counter, findsNWidgets(1));

      final counter1 = find.text("1");
      expect(counter1, findsNothing);

      await Future.delayed(const Duration(seconds: 2));
      final incrementButton = find.byKey(const Key("increment_counter"));
      await widgetTester.tap(incrementButton);

      await widgetTester.pump();

      final counter2 = find.text("1");
      expect(counter2, findsOneWidget);
      await Future.delayed(const Duration(seconds: 2));


    });

    testWidgets("Verify Login Screen with incorrect credentials", (widgetTester)async{
      app.main();
      await widgetTester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      await widgetTester.enterText(find.byType(TextFormField).at(0), "username1");
      await Future.delayed(const Duration(seconds: 2));

      await widgetTester.enterText(find.byType(TextFormField).at(1), "passwordX");
      await Future.delayed(const Duration(seconds: 2));

      await widgetTester.tap(find.byType(ElevatedButton));
      await Future.delayed(const Duration(seconds: 2));

      // For transition
      await widgetTester.pumpAndSettle();

      await Future.delayed(const Duration(seconds: 2));
      expect(find.byType(AlertDialog),findsOneWidget);
    });
  });

}