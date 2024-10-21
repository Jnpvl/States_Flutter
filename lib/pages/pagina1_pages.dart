import 'package:estados/bloc/user/user_bloc.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina1Pages extends StatelessWidget {
  const Pagina1Pages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<UserBloc>(context).add(DeleteUser());
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(builder: (_, state) {
        return (state.existUser ?? false)
            ? InformacionUsuario(user: state.user!)
            : const Center(child: Text('No existe usuario'));
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'pagina2');
        },
        child: Icon(Icons.abc_outlined),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario user;

  const InformacionUsuario({required this.user});

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
            title: Text('Nombre: ${user.nombre}'),
          ),
          ListTile(
            title: Text('Edad: ${user.edad}'),
          ),
          Text(
            'Profesiones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ...user.profesiones
              .map((profesiones) => ListTile(
                    title: Text(profesiones),
                  ))
              .toList()
        ],
      ),
    );
  }
}
