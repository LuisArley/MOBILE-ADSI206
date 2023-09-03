import 'package:flutter/material.dart';
// import 'package:flutter_application_1/Regist.dart';
// import 'package:jueputa/screens/Regist.dart';
import 'package:jueputa/screens/login.dart';

// import 'Regist.dart';
// import 'GrayEst.dart';
// import 'datos.dart';
// import 'info.dart';
// import 'login.dart';
// import 'report.dart';
// import 'Regist.dart';
// import 'package:flutter_application_1/screens/splash_screen.dart';

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
        // '/DatosImportantesPage': (context) => DatosImportantesPage(),
        // '/GraficasEstadisticasPage': (context) => GraficasEstadisticasPage(),
        // '/ReportesPage': (context) => ReportesPage(),

        // 'regisPage': (BuildContext context) => regisPage(),
      },
    );
  }
}
