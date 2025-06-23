// ignore_for_file: use_build_context_synchronously

import 'package:app_chumi/api/usuario_api.dart';
import 'package:app_chumi/models/UsuarioRequest.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickalert/quickalert.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Dio dio = Dio();
  late UsuarioApi usuarioApi;
  TextEditingController usuarioController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    usuarioApi = UsuarioApi(dio);
  }

  void mensajeError() {
    QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Oops ... :( ',
        text: 'Credenciales invalidas ');
  }

  void mensajeCarga() {
    QuickAlert.show(
        context: context,
        type: QuickAlertType.loading,
        title: 'loading.... ',
        text: 'Iniciando Sesion ');
  }

  void mensajeOk(String nombre) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      title: 'BIENVENIDO',
      text: ' $nombre',
    );
  }

  void goToInicio() {
    GoRouter.of(context).go('/inicio');
  }

  void login() async {
    final String username = usuarioController.text;
    final String password = passwordController.text;

    final request = UsuarioRequest(nombreUsuario: username, clave: password);

    try {
      final usuario = await usuarioApi.login(request);
      if(!context.mounted) return;
      mensajeOk(usuario.nombre);
      goToInicio();
    } catch (e) {
      mensajeError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            const Stack(
              alignment: Alignment(0.0, 8.0),
              children: <Widget>[
                SizedBox(
                  height: 80.0,
                ),
                Image(
                  image: AssetImage('assets/images/cumple-logo.png'),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25.0, bottom: 10.0),
                  child: Text(
                    'Inicio Sesion',
                    style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      color: Color(0xFF152942),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 90.0, left: 40.0, right: 40.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: usuarioController,
                    decoration: const InputDecoration(
                      labelText: 'Usuario',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4073AE),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF4073AE),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Contraseña',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4073AE),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 35.0,
            ),
            Row(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(right: 80.0, left: 20.0),
                  child: Text(
                    'Iniciar Sesion',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1E354E),
                      fontSize: 30.0,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 35.0, right: 10.0, left: 50.0),
                  child: FloatingActionButton(
                    backgroundColor: const Color(0xFF4073AE),
                    onPressed: () {
                      login();
                    },
                    child: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
