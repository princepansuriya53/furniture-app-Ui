import 'package:flutter/material.dart';

class LognScreen extends StatelessWidget {
  const LognScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Screen')),
      body: const Center(child: Text('LognScreen')),
    );
  }
}
