import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_assesment_2/bloc/login_bloc.dart';
import 'package:training_assesment_2/bloc/modals_bloc.dart';
import 'package:training_assesment_2/model/home_page.dart';

class LoginPage extends StatefulWidget {
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
        bloc: _bloc,
        listener: (context, state) {
          if (state is LoginLoadingState) {
             isLoading = true;
            Center(child: CircularProgressIndicator());
          } else if (state is LoginSuccessState) {
             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Login Successfully"),
            ));
            isLoading = false;
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => BlocProvider(
                      create: (context) => ModalsBloc(),
                      child: HomePage(),)));
           // Navigator.push(context, MaterialPageRoute(builder:(context) => HomePage() ));
          } else if (state is LoginErrorState) {
            isLoading = false;
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Failed to login"),
            ));
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
            bloc: _bloc,
            builder: (context, state) {
              return Scaffold(
                backgroundColor: Color.fromARGB(255, 242, 245, 245),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(top: 100, left: 20, right: 20),
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Welcome !",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top:4.0),
                              child: Text(
                                "Please login to continue",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 70,
                            ),
                            Container(
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                 Padding(
                                    padding: const EdgeInsets.only(left:8.0, top: 8.0),
                                    child: Text("Email",
                                     style: TextStyle(
                                      fontSize: 20
                                     ),),
                                  ),
                                  TextFormField(
                                      controller: emailController,
                                      decoration:  InputDecoration(
                                        filled: true, 
                                       fillColor: Colors.white,
                                       border: InputBorder.none,
                                       // border: OutlineInputBorder(),
                                        //hintText: "Email"
                                        //labelText: 'Email',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Email is required.";
                                        }
                                      }),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              color: Colors.white,
                              
                              child: Column(
                                
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left:8.0, top: 8.0),
                                    child: Text("Password",
                                     style: TextStyle(
                                      fontSize: 20
                                     ),),
                                  ),
                                  TextFormField(
                                      controller: passwordController,
                                      obscureText: !_isVisible,
                                      
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Password is required.";
                                        }
                                      },
                                      decoration: InputDecoration(
                                       filled: true,
                                       fillColor: Colors.white,
                                       border: InputBorder.none,
                                        //border: OutlineInputBorder(),
                                       // hintText: "Password",
                                       // isDense: true,
                                        // labelText: 'Password',
                                       // enabled: true,
                                        suffixIcon: IconButton(
                                          icon: Icon(_isVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off),
                                          onPressed: () => setState(() {
                                            _isVisible = !_isVisible;
                                          }),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                                SizedBox(height: 15,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("Forgot Password?")
                                  ],
                                ),
                                SizedBox(height: 25,),
                                ElevatedButton(
                                   style: ElevatedButton.styleFrom(
                                    primary: Colors.blue.shade700,
                                    minimumSize: Size(500, 50),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40.0))),
                                  onPressed: (){
                                    if (emailController != " " &&
                                      passwordController != " ") {
                                    login();
                                  }
                                  if(_formKey.currentState!.validate()){
                              
                                  }
                                }, child: isLoading
                                    ? Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      ): Text("Login",style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                      ),)),
                                     SizedBox(
                                      height: 40,
                                     ),
                                     Column(
                                       // mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                                  "Or",
                                                  style: TextStyle(
                                                    fontSize: 25,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(
                                      height: 40,
                                     ),
                                                 Row(
                                        //crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.facebook_sharp,
                                          color: Colors.blue.shade700,
                                          size: 50,),
                                           SizedBox(
                                     width: 25,
                                     ),
                                          Icon(Icons.group_work,
                                          color: Colors.red.shade800,

                                          size: 50,),
                                          
                                        ],
                                      ),
                                        SizedBox(
                                      height: 60,
                                     ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Don't have an account ?"),
                                           Text(" Sign Up",
                                      style:TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w500
                                      ) ,)
                                        ],
                                      ),
                                     
                                        ],
                                      ),
                                     
                          ],
                           
                                      
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
