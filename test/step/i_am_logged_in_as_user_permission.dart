import 'package:flutter_test/flutter_test.dart';

import 'i_am_logged_in_as.dart';

/// Usage: I am logged in as {'Administrador Geral'} user permission
Future<void> iAmLoggedInAsUserPermission(
    WidgetTester tester, String userRole) async {
  
  iAmLoggedInAs(tester, userRole);
}
