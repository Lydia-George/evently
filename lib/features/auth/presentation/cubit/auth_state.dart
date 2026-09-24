enum AuthStatus {
  checking,
  authenticated,
  unauthenticated,
}

class AuthState{
  final AuthStatus status;

  const AuthState({required this.status});


}