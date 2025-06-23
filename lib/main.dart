import 'package:app_chumi/pages/home.dart';
import 'package:app_chumi/pages/inicio.dart';
import 'package:app_chumi/pages/login.dart';
import 'package:app_chumi/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}


final GoRouter _router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const Splash(),
  ),
  GoRoute(
    path: '/login',
    builder: (context, state) => const Login(),
  ),
  GoRoute(
    path: '/inicio',
    builder: (context, state) => const Inicio(),
  ),
  GoRoute(
    path: '/home',
    builder: (context, state) => const Home(),
  ),
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Importadora Cumpleaños',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerConfig: _router,
    );
  }
}
