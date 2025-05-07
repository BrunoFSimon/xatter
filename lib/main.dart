import 'package:flutter/material.dart';

void main() {
  runApp(_InitializerPage());
}

class _InitializerPage extends StatelessWidget {
  final controller = _InitializerController();

  _InitializerPage();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }
}

class _InitializerController {
  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 1));
    // TODO direcionar para tela inicial
  }
}
