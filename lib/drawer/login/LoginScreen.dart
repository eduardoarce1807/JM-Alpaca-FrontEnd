import 'package:flutter/material.dart';

import 'package:jm_alpaca/drawer/login/model/AuthResponse.dart';
import 'package:jm_alpaca/drawer/login/provider/AuthProvider.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginDrawer extends StatefulWidget {
  static String ruta = "/";

  @override
  State<StatefulWidget> createState() {
    return _LoginDrawer();
  }
}

class _LoginDrawer extends State<LoginDrawer> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String usuarioIngresado = "";
  String contrasenaIngresada = "";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'JM Alpaca',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 60.0,
                        color: Colors.blue),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  obtenerCampoUsuario(),
                  SizedBox(
                    height: 20,
                  ),
                  obtenerCampoContrasena(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          print('Forgotted Password!');
                        },
                        child: Text(
                          '¿Olvidaste tu contraseña?',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  obtenerBotonIniciarSesion(),
                  SizedBox(
                    height: 30,
                  ),
                  Divider(
                    color: Colors.black,
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '¿Aún no tienes una cuenta?',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 16.0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          print('Sign Up');
                          // Get.to(SignUpDrawer());
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: Text('Regístrate'),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////
  
  TextFormField obtenerCampoUsuario() {
    return TextFormField(

      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Usuario',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.person),
      ),
      onSaved: (value) {
        usuarioIngresado = value!;
      },
    );
  }

  TextFormField obtenerCampoContrasena() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Contraseña',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.lock),
        suffixIcon: Icon(Icons.remove_red_eye),
      ),
      validator: (value) {
        if (value!.length >= 5) {
          return null;
        } else {
          return "La contraseña no cumple requisitos mínimos de seguridad";
        }
      },
      onSaved: (value) {
        contrasenaIngresada = value!;
      },
    );
  }

  ElevatedButton obtenerBotonIniciarSesion() {
    return ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
          textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            validarToken(usuarioIngresado, contrasenaIngresada);
          }
        },
        child: Text("Iniciar Sesión"));
  }


  void validarToken(String usuario, String contrasena) async {
    AuthProvider ap = AuthProvider();
    AuthResponse ar = await ap.obtenerToken(usuarioIngresado, contrasenaIngresada);

    if (ar.message != "Usuario autenticado") {
      print("Fail :(");
    } else {
      print("Login Exitoso :D");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', ar.token!);

      formKey.currentState!.reset();

      print(ar.message);
      print(ar.token);

      Navigator.pushNamed(context, '/home');
    }
  }

}