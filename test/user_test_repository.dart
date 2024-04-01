import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/user_model.dart';
import 'package:flutter_tests/user_repository.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class MockHTTPClient extends Mock implements Client {}

void main() {
  late UserRepository userRepository;
  late MockHTTPClient mockHTTPClient;
  setUp(() {
    mockHTTPClient = MockHTTPClient();
    userRepository = UserRepository(client: mockHTTPClient);
  });
  group("UserRepository - ", () {
    group("getUser function - ", () {
      test(
          "Given UserRepository class when getUser function is called and status code is 200, then a UserModel should be returned",
          () async {
        // Arrange
        when(
            ()=>mockHTTPClient
              .get(Uri.parse("https://jsonplaceholder.typicode.com/users/1")),
        ).thenAnswer((invocation) async {
          return Response('''{}''', 200);
        });
        // Act
        final user = await userRepository.getUser();
        // Assert
        expect(user, isA<User>());
      });
      test(
          "Given UserRepository class when getUser function is called and status code is not 200, then an Exception should be thrown",
          () async {
        // Arrange
        // Act
        when(
            ()=>mockHTTPClient
              .get(Uri.parse("https://jsonplaceholder.typicode.com/users/1")),
        ).thenAnswer((invocation) async {
          return Response('''{}''', 500);
        });
        // Act
        final user = userRepository.getUser();
        // Assert
        expect(user, throwsException);
      });
    });
  });
}
