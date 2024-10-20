import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Pagina2Pages extends StatelessWidget {
  const Pagina2Pages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioService.usuarioStream,
          builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
            return snapshot.hasData
                ? Text('Nombre: ${snapshot.data?.nombre}')
                : Text('Pagina dos');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              child: Text('Establecer usuario'),
              onPressed: () {
                final nuevoUsuario = new Usuario(
                    nombre: 'Juan',
                    edad: 12,
                    profesiones: ['alba;i;', 'chambeador']);
                usuarioService.cargarUsuario(nuevoUsuario);
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text('Cambiar edad'),
              onPressed: () {
                usuarioService.cambiarEdad(32);
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text('Establecer profesion'),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
