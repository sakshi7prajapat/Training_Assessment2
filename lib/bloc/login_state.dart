part of 'login_bloc.dart';

@immutable
sealed class LoginState extends Equatable{
 const LoginState();
  
  @override
  List<Object> get props => [];

}

 class LoginInitial extends LoginState {

}

 class LoginLoadingState extends LoginState {
  @override
  List<Object> get props => [];
}


class LoginSuccessState extends LoginState{
  @override
  List<Object> get props => [];
}

class LoginErrorState extends LoginState{

  @override
 final String errorMessage;

  LoginErrorState(this.errorMessage);
}