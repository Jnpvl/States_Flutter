part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class ActivateUser extends UserEvent {
  final Usuario user;
  ActivateUser(this.user);
}

class ChangeUserAge extends UserEvent {
  final int? age;

  ChangeUserAge(this.age);
}

class AddProfesion extends UserEvent {
  final String? Profesion;

  AddProfesion(this.Profesion);
}

class DeleteUser extends UserEvent {}
