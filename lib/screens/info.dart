import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 100, 3, 174),
              Color.fromARGB(255, 246, 251, 255),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.info_outline,
                  size: 100,
                  color: Colors.white,
                ),
                SizedBox(height: 10),
                Text(
                  "INFORMACIÓN",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 40),
                _buildButton(
                  context,
                  "Datos Importantes",
                  '/DatosImportantesPage', // Ruta para Datos Importantes
                  Icons.info,
                ),
                SizedBox(height: 20),
                _buildButton(
                  context,
                  "Graficas y Estadísticas",
                  '/GraficasEstadisticasPage', // Ruta para Gráficas y Estadísticas
                  Icons.bar_chart,
                ),
                SizedBox(height: 20),
                _buildButton(
                  context,
                  "Reportes",
                  '/ReportesPage', // Ruta para Reportes
                  Icons.assignment,
                ),
                SizedBox(height: 40),
                _buildBackButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String buttonText, String routeName,
      IconData iconData) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Column(
        children: [
          Icon(iconData,
              size: 48, color: const Color.fromARGB(255, 138, 43, 226)),
          SizedBox(height: 10),
          Text(
            buttonText,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        primary: Colors.white,
        onPrimary: Color.fromARGB(255, 138, 43, 226),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        minimumSize: Size(double.infinity, 0),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        "Regresar",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        primary: Colors.white,
        onPrimary: Color.fromARGB(255, 138, 43, 226),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
        minimumSize: Size(double.infinity, 0),
      ),
    );
  }
}
