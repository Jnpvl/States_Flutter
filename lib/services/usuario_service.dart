import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';

class UsuarioService with ChangeNotifier {
  Usuario? _usuario;

  Usuario get usuario {
    if (_usuario == null) {
      throw Exception("Usuario no está inicializado.");
    }
    return _usuario!;
  }

  bool get existeUsuario => _usuario != null;

  set usuario(Usuario user) {
    _usuario = user;
    notifyListeners();
  }

  void cambiarEdad(int edad) {
    this._usuario?.edad = edad;
    notifyListeners();
  }

  void removerUsuario() {
    this._usuario = null;
    notifyListeners();
  }

  void nuevaProfesion() {
    this._usuario?.profesiones.add('profesion');
    notifyListeners();
  }
}
