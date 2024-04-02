import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/presentation/user_screen.dart';
import 'package:flutter_tests/user_model.dart';

void main() {
  testWidgets("Display List of users with title as name and subtitle as email",
      (widgetTester) async {
    final users = [
      User(id: 1, name: "User1", email: "user1@domain.com"),
      User(id: 2, name: "User2", email: "user2@domain.com"),
    ];

    Future<List<User>> mockFetchUsers() {
      return Future.delayed(const Duration(seconds: 1), () => users);
    }

    await widgetTester.pumpWidget(MaterialApp(
      home: UserScreen(
        futureUsers: mockFetchUsers(),
      ),
    ));

    expect(find.byType(CircularProgressIndicator),findsOneWidget);
    await widgetTester.pumpAndSettle();
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(ListTile), findsNWidgets(users.length));

    for(final user in users){
      expect(find.text(user.name), findsOneWidget);
      expect(find.text(user.email), findsOneWidget);
    }
  });
}
