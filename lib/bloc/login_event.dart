part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

 
}

class PerformLogin extends LoginEvent{

  String? email;
  String? password;

  PerformLogin({
    required this.email,
    required this.password,
  }
  );

  @override
  List<Object?> get props => [email , password];

  String toString()  => 'PerformLogin {username: $email , password: $password}';

}