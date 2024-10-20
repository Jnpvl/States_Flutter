import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:estados/bloc/usuario/usuario_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina1Pages extends StatelessWidget {
  const Pagina1Pages({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioCubit = BlocProvider.of<UsuarioCubit>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        actions: [
          IconButton(
              onPressed: () {
                usuarioCubit.borrarUsuario();
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'pagina2');
        },
        child: Icon(Icons.abc_outlined),
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (_, state) {
        switch (state.runtimeType) {
          case UsuarioInitial:
            return Center(child: Text('No hay informacon del usuario'));
          case UsuarioActivo:
            return InformacionUsuario((state as UsuarioActivo).usuario);
          default:
            return Text('Usuario no encontrado');
        }

        // if (state is UsuarioInitial) {
        //   return Center(child: Text('No hay informacon del usuario'));
        // } else if (state is UsuarioActivo) {
        //   return InformacionUsuario(state.usuario);
        // } else {
        //   return Text('Usuario no encontrado');
        // }
      },
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const InformacionUsuario(this.usuario);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.blue,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ListTile(
            title: Text('Nombre: ${usuario.nombre}'),
          ),
          ListTile(
            title: Text('Edad: ${usuario.edad}'),
          ),
          Text(
            'Profesiones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ...usuario.profesiones
              .map((profesion) => ListTile(
                    title: Text(profesion),
                  ))
              .toList()
        ],
      ),
    );
  }
}
