import 'package:flutter/material.dart';

abstract class LoginBlocEvent {}

class LoginButtonPressed extends LoginBlocEvent {
  final String email;
  final String password;

  LoginButtonPressed({required this.email, required this.password});
}
