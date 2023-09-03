import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Control/auth_services.dart';
import '../Control/globals.dart';
import '../ElevatedButton.dart';
import 'info.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   String _email = '';
//   String _password = '';

//   loginPressed() async {
//     if (_email.isNotEmpty && _password.isNotEmpty) {
//       http.Response response = await AuthServices.login(_email, _password);
//       Map responseMap = jsonDecode(response.body);
//       if (response.statusCode == 200) {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (BuildContext context) => InfoPage(),
//             ));
//       } else {
//         errorSnackBar(context, responseMap.values.first);
//       }
//     } else {
//       errorSnackBar(context, 'enter all required fields');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // Elimina el AppBar aquí
//       body: Padding(
//         padding: const EdgeInsets.all(32.0),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                       color: Color.fromARGB(255, 100, 3, 174), width: 2),
//                   shape: BoxShape.circle,
//                 ),
//                 child: const Icon(Icons.person,
//                     color: Color.fromARGB(255, 100, 3, 174), size: 120),
//               ),
//               const SizedBox(height: 50),
//               _inputField("Usuario", _email),
//               const SizedBox(height: 20),
//               _inputField("Contraseña", _password, isPassword: true),
//               const SizedBox(height: 50),
//               ElevatedButton(
//                 onPressed: () => loginPressed(),
//                 child: const SizedBox(
//                   width: double.infinity,
//                   child: Text(
//                     "Crear Cuenta",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 20),
//                   ),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   shape: const StadiumBorder(),
//                   primary: Colors.white,
//                   onPrimary: Color.fromARGB(255, 100, 3, 174),
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                 ),
//               ),
//               // _loginBtn(),
//               // const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _inputField(String hintText, String value, {isPassword = false}) {
//     var border = OutlineInputBorder(
//         borderRadius: BorderRadius.circular(18),
//         borderSide: const BorderSide(color: Color.fromARGB(255, 100, 3, 174)));

//     return TextField(
//       style: const TextStyle(color: Color.fromARGB(255, 100, 3, 174)),
//       onChanged: (newValue) {
//         if (hintText == "Usuario") {
//           _email = newValue;
//         } else if (hintText == "Contraseña") {
//           _password = newValue;
//         }
//       },
//       decoration: InputDecoration(
//         hintText: hintText,
//         hintStyle: const TextStyle(color: Color.fromARGB(255, 100, 3, 174)),
//         enabledBorder: border,
//         focusedBorder: border,
//       ),
//       obscureText: isPassword,
//     );
//   }
// }

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '';
  String _password = '';

  loginPressed() async {
    if (_email.isNotEmpty && _password.isNotEmpty) {
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
      errorSnackBar(context, 'Enter all required fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: const Image(
          image: AssetImage(
              'Arcoris.png'), // Reemplaza 'your_image.png' con la ruta de tu imagen
          fit: BoxFit.cover,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintStyle: TextStyle(color: Colors.purple),
                ),
                onChanged: (value) {
                  _email = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintStyle: TextStyle(color: Colors.purple),
                ),
                onChanged: (value) {
                  _password = value;
                },
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
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'LOG IN',
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
