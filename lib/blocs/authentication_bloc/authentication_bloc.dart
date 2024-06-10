import 'dart:async';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:user_repository/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  late final StreamSubscription<MyUser?> _userSubsription;

  AuthenticationBloc({required this.userRepository})
      : super(AuthenticationState.unknown()) {
    _userSubsription = userRepository.user.listen((user) {
      add(AuthenticationUserChanged(user));
    });
    on<AuthenticationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
