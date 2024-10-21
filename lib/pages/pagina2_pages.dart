import 'package:estados/bloc/user/user_bloc.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina2Pages extends StatelessWidget {
  const Pagina2Pages({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);

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
                final newUser =
                    Usuario(nombre: 'juan', edad: 22, profesiones: ['una']);

                userBloc.add(ActivateUser(newUser));
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text('Cambiar edad'),
              onPressed: () {
                userBloc.add(ChangeUserAge(2332));
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text('Establecer profesion'),
              onPressed: () {
                userBloc.add(AddProfesion('otra proseion'));
              },
            )
          ],
        ),
      ),
    );
  }
}
