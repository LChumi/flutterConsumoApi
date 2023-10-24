import 'package:flutter/material.dart';

class Dashborad extends StatefulWidget {
  const Dashborad({super.key});

  @override
  State<Dashborad> createState() => _DashboradState();
}

class _DashboradState extends State<Dashborad> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashborad')),
      body: const Center(
        child: Text('Dashboard ',style: TextStyle(fontSize: 40)), 
        ),
    );
  }
}