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
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 320,
              child: Stack(
                children: <Widget>[
                  // Positioned(
                  //   top: -5,
                  //   height: 300,
                  //   width: width,
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       image: DecorationImage(
                  //         image: AssetImage('assets/images/b2.png'),
                  //         fit: BoxFit.fill
                  //       )
                  //     ),
                  //   ),
                  // ),
                  Positioned(
                    height: 300,
                    width: width+20,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/b1.png'),
                          fit: BoxFit.fill
                        )
                      ),
                    ),
                  )
                ],
              ),
            ),
            Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Login", style: TextStyle(color: Color.fromRGBO(49, 39, 79, 1), fontWeight: FontWeight.bold, fontSize: 30),),
                    SizedBox(height: 30,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(196, 135, 198, .3),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          )
                        ]
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(
                                color: Colors.grey.shade200
                              ))
                            ),
                            child: getUsuario()
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: getPassword()
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Center(
                      child: SizedBox(
                        width: 230,
                        child: getLoginButton(),
                      )
                    ),
                    SizedBox(height: 5,),
                    Center(child: TextButton(
                          onPressed: () {
                            print('Sign Up');
                            // Get.to(SignUpDrawer());
                            Navigator.pushNamed(context, '/signup');
                          },
                          child: Text('Regístrate', style: TextStyle(color: Color.fromRGBO(49, 39, 79, .6)))
                    )),
                    
                  ],
                ),
              )
            )
          ],
        ),  
      ),
    );
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////
  
  TextFormField getUsuario() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Usuario",
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(Icons.person)
      ),
      onSaved: (value) {
        usuarioIngresado = value!;
      },
    );
  }

  TextFormField getPassword() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        hintText: 'Contraseña',
        hintStyle: TextStyle(color: Colors.grey),
        border: InputBorder.none,
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

  ElevatedButton getLoginButton() {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
        textStyle: MaterialStateProperty.all(const TextStyle(fontWeight: FontWeight.bold)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
      ),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          validarToken(usuarioIngresado, contrasenaIngresada);
        }
      },
      child: Text("Iniciar Sesión")
    );
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