import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_assesment_2/bloc/login_bloc.dart';

class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginBloc _bloc = LoginBloc();
  final _formKey = GlobalKey<FormState>();

  bool _isVisible = false;
  bool isLoading = false;
  bool _validate = false;

  String? email;
  String? Password;

  login() async {
    _bloc.add(PerformLogin(
      email: emailController.text,
      password: passwordController.text,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      bloc:_bloc,
      listener: (context , state){
          if(state is LoginLoadingState){

          }else if(state is LoginSuccessState){

          }else if(state is LoginErrorState){

          }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        bloc: _bloc,
        builder: (context, state){
            return Scaffold(
              body: Form(
                key: _formKey,
                child: const Column(
                  children:<Widget>[
                    Text("Welcome!", style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                    ),)

                  ],
                ),
              ),

            );
        }
      )
      );
  }
}