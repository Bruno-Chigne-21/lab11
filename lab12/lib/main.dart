import 'package:flutter/material.dart';
import './diferencias.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      routes: {
        '/diferencias': (context) => DiferenciasScreen(), // Nueva ruta para la pantalla de diferencias
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Alert Examples'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Mostrar la primera alerta cuando se presiona el botón
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Alerta 1'),
                      content: Text('Este es un ejemplo de alerta en Flutter.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            // Cerrar la alerta
                            Navigator.of(context).pop();
                          },
                          child: Text('Cerrar'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Mostrar Alerta 1'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Mostrar la segunda alerta cuando se presiona el botón
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Alerta 2'),
                      content: Text('¿Estás seguro de continuar?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            // Realizar alguna acción, como confirmar una acción
                            Navigator.of(context).pop();
                          },
                          child: Text('Sí'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Cancelar la acción
                            Navigator.of(context).pop();
                          },
                          child: Text('No'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Mostrar Alerta 2'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navegar a la pantalla de diferencias
                Navigator.pushNamed(context, '/diferencias');
              },
              child: Text('Diferencias'),
            ),
          ],
        ),
      ),
    );
  }
}
