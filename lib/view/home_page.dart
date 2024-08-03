import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../components/home_components/group_container.dart';

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              GroupContainer(),
              GroupContainer(),
              GroupContainer(),
              GroupContainer(),
              GroupContainer(),
              GroupContainer(),
              GroupContainer(),
              GroupContainer(),
              GroupContainer(),
              GroupContainer(),
              GroupContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
