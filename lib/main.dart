import 'package:jm_alpaca/drawer/compra/CompraBrosa.dart';
import 'package:jm_alpaca/drawer/compra/ListaDePesos.dart';
import 'package:jm_alpaca/drawer/compra/NuevaCompra.dart';
import 'package:jm_alpaca/drawer/home/home.dart';
import 'package:jm_alpaca/drawer/login/LoginScreen.dart';

import 'package:flutter/material.dart';
import 'package:jm_alpaca/drawer/login/SignUpScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData().copyWith(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ThemeData()
              .colorScheme
              .copyWith(primary: Color.fromRGBO(49, 39, 79, 1)),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        routes: {
          LoginDrawer.ruta: (BuildContext context) => LoginDrawer(),
          HomeDrawer.ruta: (BuildContext context) => HomeDrawer(),
          SignUpDrawer.ruta: (BuildContext context) => SignUpDrawer(),
          CompraBrosaDrawer.ruta: (BuildContext context) => CompraBrosaDrawer(),
          NuevaCompraDrawer.ruta: (BuildContext context) => NuevaCompraDrawer(),
          ListaDePesos.ruta: (BuildContext context) => ListaDePesos()
        });
  }
}
