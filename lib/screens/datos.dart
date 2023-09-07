import 'package:flutter/material.dart';

class DatosImportantesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información'),
        backgroundColor:
            Colors.purple, // Cambia el color de fondo de la barra de navegación
      ),
      drawer: Drawer(
        backgroundColor: Colors.transparent,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Nombre de usuario"),
              accountEmail: Text("correo@ejemplo.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Datos',
                style: TextStyle(color: Colors.purple),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => DatosImportantesPage(),
                  ),
                );
                // Navega a la página de inicio
              },
            ),
            ListTile(
              title: Text(
                'Perfil',
                style: TextStyle(color: Colors.purple),
              ),
              onTap: () {
                // Navega a la página "OtraPagina" cuando se toca "Inicio"
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => DatosImportantesPage(),
                  ),
                );
                // Navega a la página de perfil
              },
            ),
            ListTile(
              title: Text(
                'Configuración',
                style: TextStyle(color: Colors.purple),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => DatosImportantesPage(),
                  ),
                );
                // Navega a la página de configuración
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bienvenido a la página de información',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Cambia el color del texto
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Aquí puedes mostrar información importante de tu aplicación de manera moderna y atractiva.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey, // Cambia el color del texto
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Agrega aquí la funcionalidad que desees
              },
              child: Text('Hacer algo'),
              style: ElevatedButton.styleFrom(
                primary: Colors.purple, // Cambia el color de fondo del botón
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8.0), // Bordes redondeados
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
