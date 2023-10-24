import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    void goToInicio() {
      GoRouter.of(context).go('/inicio');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            goToInicio();
          },
        ),
      ),
      body: const Center(
        child: Text('Bienvenido', style: TextStyle(fontSize: 40)),
      ),
    );
  }
}
