import 'package:flutter/material.dart';
import 'package:jueputa/screens/GrayEst.dart';
import 'package:jueputa/screens/datos.dart';

import 'package:jueputa/screens/login.dart';
import 'package:jueputa/screens/report.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => LoginScreen(),

        // '/SignUpScreen': (context) => const RegisterScreen(),
        // '/SignUpScreen': (context) => SignUpScreen(),
        // '/LoginPage': (context) => LoginPage(),
        // '/InfoPage': (context) => InfoPage(),
        '/DatosImportantesPage': (context) => DatosImportantesPage(),
        '/GraficasEstadisticasPage': (context) => GraficasEstadisticasPage(),
        '/ReportesPage': (context) => ReportesPage(),

        // 'regisPage': (BuildContext context) => regisPage(),
      },
    );
  }
}
