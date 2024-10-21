import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:estados/models/usuario.dart';

part 'user_state.dart';
part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<ActivateUser>((event, emit) => emit(UserSetState(event.user)));

    on<ChangeUserAge>((event, emit) {
      final currentUser = state.user;
      if (currentUser == null) return;
      emit(UserSetState(state.user!.copyWith(edad: event.age)));
      print('evento emitido');
    });

    on<AddProfesion>((event, emit) {
      final currentUser = state.user;
      if (currentUser == null) return;
      final profesions = [...state.user!.profesiones, event.Profesion!];

      emit(UserSetState(state.user!.copyWith(profesiones: profesions)));
    });

    on<DeleteUser>((event, emit) => emit(UserInitialState()));
  }
}
