import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Pagina1Pages extends StatelessWidget {
  const Pagina1Pages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
      ),
      body: StreamBuilder(
        stream: usuarioService.usuarioStream,
        builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
          return snapshot.hasData
              ? InformacionUsuario(usuario: usuarioService.usuario)
              : Center(
                  child: Text('No hay informacion'),
                );
        },
      ),
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
  final Usuario? usuario;

  const InformacionUsuario({this.usuario});

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
            title: Text('Nombre: ${usuario?.nombre}'),
          ),
          ListTile(
            title: Text('Edad: ${usuario?.edad}'),
          ),
          Text(
            'Profesiones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ListTile(
            title: Text('Profesion 1: '),
          ),
          ListTile(
            title: Text('Profesion 2: '),
          )
        ],
      ),
    );
  }
}
