import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:flutter/material.dart';
import 'package:jm_alpaca/drawer/compra/CompraBrosa.dart';

import 'package:jm_alpaca/drawer/home/home.dart';
import 'package:jm_alpaca/drawer/login/LoginScreen.dart';

class CommonDrawer {
  static ListTile obtenerElemento(
      Icon icono, String nombre, String ruta, BuildContext bContext) {
    return ListTile(
      leading: icono,
      title: Text(nombre, style: TextStyle(fontSize: 15),),
      onTap: () {
        Navigator.pushNamed(bContext, ruta);
      },
    );
  }

  static Drawer obtenerDrawer(BuildContext contexto) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: Text("Parcial 1 - Eduardo Arce"),
            accountEmail: Text("eduardo.arce1807@gmail.com"),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMBecQQO441ONmYqdn3jeBsfdy6SOD2Cg4_Vu7vHvRpxT0pZMyCt5NEXpm60nVCFQUbIo&usqp=CAU'),
                    fit: BoxFit.cover)),
          ),
          obtenerElemento(
              Icon(TablerIcons.home), "Home", HomeDrawer.ruta, contexto),
           obtenerElemento(
              Icon(TablerIcons.report_money), "Compra Brosa", CompraBrosaDrawer.ruta, contexto),
          obtenerElemento(
            Icon(TablerIcons.user), "Login", LoginDrawer.ruta, contexto),
        ],
      ),
    );
  }
}
