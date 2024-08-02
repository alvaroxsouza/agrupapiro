import 'package:agrupapiro/enum/rotas.dart';
import 'package:flutter/material.dart';

import '../components/button_custom.dart';
import '../components/input_custom.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          children: [
            Text('Home'),
          ],
        ),
      ),
    );
  }
}
