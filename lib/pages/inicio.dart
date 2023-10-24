import 'package:app_chumi/pages/dashboard.dart';
import 'package:app_chumi/pages/pagin.dart';
import 'package:app_chumi/pages/productos.dart';
import 'package:app_chumi/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  int currenTab = 0;
  final List<Widget> vistas = [
    const Dashborad(),
    const Perfil(),
    const Pagin(),
    const Productos()
  ];

  void goToHome() {
    GoRouter.of(context).go('/home');
  }

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const Dashborad();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.backpack),
        onPressed: () {
          goToHome();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //lado derecho de la barra
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Dashborad();
                        currenTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.dashboard,
                          color: currenTab == 0 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'Dasboard',
                          style: TextStyle(
                              color:
                                  currenTab == 0 ? Colors.blue : Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Perfil();
                        currenTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_circle,
                          color: currenTab == 1 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'perfil',
                          style: TextStyle(
                              color:
                                  currenTab == 1 ? Colors.blue : Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //lado izquierda de la barra
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Pagin();
                        currenTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.pages,
                          color: currenTab == 2 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'pagina',
                          style: TextStyle(
                              color:
                                  currenTab == 2 ? Colors.blue : Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Productos();
                        currenTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.production_quantity_limits,
                          color: currenTab == 3 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'Productos',
                          style: TextStyle(
                              color:
                                  currenTab == 3 ? Colors.blue : Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
