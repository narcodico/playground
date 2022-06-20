// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLocalDataSource extends Mock implements LocalDataSource {}

void main() {
  group('Static', () {
    late Subject subject;
    late MockLocalDataSource mockLocalDataSource;

    setUp(() {
      mockLocalDataSource = MockLocalDataSource();
      subject = Subject(mockLocalDataSource);
    });

    test('bla bla', () async {
      const expected = true;
      when(() => mockLocalDataSource.setShowTimer(any<bool>()))
          .thenAnswer((_) => expected);
      await subject.method();
      verify(() => mockLocalDataSource.setShowTimer(any<bool>())).called(1);
    });
  });
}

class Subject {
  Subject(this.localDataSource);

  final LocalDataSource localDataSource;

  Future<bool> method() async {
    return localDataSource.setShowTimer(true);
  }
}

class LocalDataSource {
  // ignore: avoid_positional_boolean_parameters
  bool setShowTimer(bool value) {
    return value;
  }
}
