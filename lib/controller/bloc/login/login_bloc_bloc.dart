import 'package:bloc/bloc.dart';
import 'package:zizzia_e_commerce/controller/functions/login/log_function.dart';

import 'login_bloc_event.dart';
import 'login_bloc_state.dart';

class LoginBlocBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginBlocBloc()
      : super(LoginBlocState(
            isLoading: false, isSuccess: false, isFailure: false)) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  void _onLoginButtonPressed(
      LoginButtonPressed event, Emitter<LoginBlocState> emit) async {
    emit(LoginBlocState(isLoading: true, isSuccess: false, isFailure: false));

    try {
      final success = await loginFunction(event.email, event.password);
      if (success) {
        emit(LoginBlocState(
            isLoading: false, isSuccess: true, isFailure: false));
      } else {
        emit(LoginBlocState(
            isLoading: false, isSuccess: false, isFailure: true));
      }
    } catch (_) {
      emit(LoginBlocState(isLoading: false, isSuccess: false, isFailure: true));
    }
  }
}
