import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/counter.dart';

void main(){
  late Counter counter;
  setUp((){
    counter = Counter();
  });

  group("Counter Class 0 ",(){
    // Given when then
    test("Given counter class when it is instantiated, then value of count should be 0", (){
      // Arrange
      // Act
      final value = counter.count;
      // Assert
      expect(value, 0);
    });
    test("Given counter class when it is incremented then the value of count should be 1",(){
      counter.incrementCounter();
      final value = counter.count;
      expect(value, 1);
    });
    test("Given counter class when it is decremented then the value of count should be -1",(){
      counter.decrementCounter();
      final value = counter.count;
      expect(value, -1);
    });
    test("Given counter class when it is reset then the value of count should be 0",(){
      counter.reset();
      final value = counter.count;
      expect(value, 0);
    });

    tearDown(() => null);
    tearDownAll(() => null);
  });
  }