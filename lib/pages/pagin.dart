import 'package:flutter/material.dart';

class Pagin extends StatefulWidget {
  const Pagin({super.key});

  @override
  State<Pagin> createState() => _PaginState();
}

class _PaginState extends State<Pagin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text('Pagina')),
      body: const Center(
        child: Text('Bienvenido' , style: TextStyle(fontSize: 40)),
      ),
    );
  }
}