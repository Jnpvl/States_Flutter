import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina2Pages extends StatelessWidget {
  const Pagina2Pages({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario
            ? Text('Nombre: ${usuarioService.usuario.nombre}')
            : Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              child: Text('Establecer usuario'),
              onPressed: () {
                final newUser = new Usuario(
                    nombre: 'juan', edad: 32, profesiones: ['nada', 'otro']);

                usuarioService.usuario = newUser;
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text('Cambiar edad'),
              onPressed: () {
                usuarioService.usuario.edad = 20;
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text('Establecer profesion'),
              onPressed: () {
                usuarioService.nuevaProfesion();
              },
            )
          ],
        ),
      ),
    );
  }
}
