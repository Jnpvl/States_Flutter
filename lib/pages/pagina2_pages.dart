import 'package:estados/bloc/usuario/usuario_cubit.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina2Pages extends StatelessWidget {
  const Pagina2Pages({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioCubit = BlocProvider.of<UsuarioCubit>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              child: Text('Establecer usuario'),
              onPressed: () {
                final newUsuario =
                    Usuario(nombre: 'Juan', edad: 20, profesiones: ['dasdas']);
                usuarioCubit.seleccionarUsuario(newUsuario);
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text('Cambiar edad'),
              onPressed: () {
                usuarioCubit.cambiarEdad(32);
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text('Establecer profesion'),
              onPressed: () {
                usuarioCubit.agregarProfesion();
              },
            )
          ],
        ),
      ),
    );
  }
}
