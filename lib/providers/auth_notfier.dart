import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agrupapiro/services/auth_services.dart';
import 'package:agrupapiro/view/home_page.dart';

class AuthNotfier extends StateNotifier<bool> {
  final AuthService authServices;
  AuthNotfier(this.authServices):super(false);

}