import 'package:flutter/material.dart';

class Productos extends StatefulWidget {
  const Productos({super.key});

  @override
  State<Productos> createState() => _productosState();
}

// ignore: camel_case_types
class _productosState extends State<Productos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Productos'),),
      body: const Center(
        child: Text('Productos' , style: TextStyle(fontSize: 50),),
      ),
    );
  }
}