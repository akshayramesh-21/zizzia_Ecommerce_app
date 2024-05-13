class LoginBlocState {
  final bool isLoading;
  final bool isSuccess;
  final bool isFailure;

  LoginBlocState({
    required this.isLoading,
    required this.isSuccess,
    required this.isFailure,
  });
}
