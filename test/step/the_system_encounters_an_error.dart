import 'package:flutter_test/flutter_test.dart';

/// Usage: the system encounters an error
Future<void> theSystemEncountersAnError(WidgetTester tester) async {
  throw UnimplementedError();
}
