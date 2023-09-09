import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Control/auth_services.dart';
import '../Control/globals.dart';
import '../ElevatedButton.dart';
import 'info.dart';
import 'package:jueputa/utils/validations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '';
  String _password = '';
  bool emailError = false;
  bool passwordError = false;

  loginPressed() async {
    bool emailValid = isEmailValid(_email);

    if (emailValid && _password.isNotEmpty) {
      http.Response response = await AuthServices.login(_email, _password);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => InfoPage(),
          ),
        );
      } else {
        errorSnackBar(context, responseMap.values.first);
      }
    } else {
      setState(() {
        emailError = !emailValid;
        passwordError = _password.isEmpty;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.person,
                  color: Color.fromARGB(156, 172, 29, 177), size: 120),
              Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: emailError ? Colors.red : Colors.purple,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: emailError ? Colors.red : Colors.purple,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      hintStyle: TextStyle(
                        color: emailError ? Colors.red : Colors.purple,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _email = value;
                        emailError = false;
                      });
                    },
                  ),
                  if (emailError)
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 4.0),
                      child: Text(
                        "El correo electrónico no es válido.",
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Contraseña',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: passwordError ? Colors.red : Colors.purple,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: passwordError ? Colors.red : Colors.purple,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      hintStyle: TextStyle(
                        color: passwordError ? Colors.red : Colors.purple,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _password = value;
                        passwordError = false;
                      });
                    },
                  ),
                  if (passwordError)
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 4.0),
                      child: Text(
                        "La contraseña no puede ir vacía.",
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: () => loginPressed(),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Iniciar Sesión',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
