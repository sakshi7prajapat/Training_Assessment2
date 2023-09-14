import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<PerformLogin>((event, emit) async{
      try{
        emit(LoginLoadingState());
        String result = await login(event.email , event.password);
        if(result != null){
          print("hello");
          emit(LoginSuccessState());
        }
      }catch(e){
           emit(LoginErrorState(e.toString()));
        print(e.toString());
      }
    });
  }

  Future login(email, password) async{
try{
  var response = await http.post(Uri.parse("https://reqres.in/api/login"),
  body: ({'email': email, 'password': password}));
  if(response.statusCode == 200){
    return response.body;
  }

}catch(e){
 return null;
}
  }
}
