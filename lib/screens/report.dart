import 'package:flutter/material.dart';

class ReportesPage extends StatelessWidget {
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
                  Icons.assignment,
                  size: 100,
                  color: Colors.white,
                ),
                SizedBox(height: 10),
                Text(
                  "REPORTES",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 40),
                _buildButton(
                  context,
                  "Reporte 1",
                  '/reporte1',
                  Icons.description,
                ),
                SizedBox(height: 20),
                _buildButton(
                  context,
                  "Reporte 2",
                  '/reporte2',
                  Icons.description_outlined,
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
