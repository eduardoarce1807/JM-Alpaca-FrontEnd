import 'package:jm_alpaca/drawer/CommonDrawer.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatefulWidget {
  static String ruta = "/home";

  @override
  State<StatefulWidget> createState() {
    return _HomeDrawer();
  }
}

class _HomeDrawer extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        drawer: CommonDrawer.obtenerDrawer(context),
        body: Container(
          width: MediaQuery.of(context).size.width,
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(colors: [
          //     Colors.black12,
          //     Colors.black54,
          //   ]),
          // ),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'JM Alpaca',
                      style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      '¿Quiénes somos?',
                      style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'JM Alpaca Company es una empresa acopiadora de fibra de alpaca en la región Puno, en Perú.',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 15, color: Colors.black)
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Fundador, director y CEO: Jacinto Mamani Coaquira',
                      style: TextStyle(fontSize: 15, color: Colors.black)
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Fundada el 12 de setiembre de 1985.',
                      style: TextStyle(fontSize: 15, color: Colors.black)
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Cuenta con 8 socios y abarca 5 distritos.',
                      style: TextStyle(fontSize: 15, color: Colors.black)
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Misión:',
                      style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Ser un acopador líder en la región Puno que esté al servicio de sus proveedores de fibra de alpaca para mejorar su calidad de vida.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.black)
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Visión:',
                      style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Promover el acopio para un buen vivir.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.black)
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
