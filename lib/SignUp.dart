import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class SignUp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignUpPageState();
  }
}


class _SignUpPageState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  void sendData() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    print(email);
    print(password);
    Map data = {"email": email, "password" : password};
    await http.post("http://192.168.42.106:3008/user/signup",
        headers: {
          'Content-type': 'application/x-www-form-urlencoded',
          'Accept' : 'application/json'
        },
        body: data
    ).then((response){
      showDialog(context: context, child:
      new AlertDialog(
        title: new Text("SignUp"),
        content: new Text(response.body),
      )
      );
    }
    );
  }

  @override
  Widget build(BuildContext context){

    final logo_img = new CircleAvatar(
      radius: 50.0,
      backgroundColor: Colors.black,
      child: Icon(
        Icons.queue_music,
        color: Colors.white,
        size: 70.0,
      ),
    );

    final email = new Theme(
        data: new ThemeData(
          primaryColor: Colors.blue,
          primaryColorDark: Colors.white,
          hintColor: Colors.white,
        ),
      child: TextFormField(
        style: new TextStyle(color: Colors.white),
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: "Enter your email address",
        contentPadding: EdgeInsets.fromLTRB(15.0,20.0,15.0,20.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0)
        )
      ),
      )
    );

      final password = new Theme(

          data: new ThemeData(
            primaryColor: Colors.blue,
            primaryColorDark: Colors.white,
            hintColor: Colors.white,
          ),
      child: TextFormField(
        style: new TextStyle(color: Colors.white),
        controller: _passwordController,
        autofocus: false,
        obscureText: true,
        decoration: InputDecoration(
            hintText: "Enter your new password",
            contentPadding: EdgeInsets.fromLTRB(15.0,20.0,15.0,20.0),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0)
            )
        ),
      )
      );
      final loginButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Material(
          borderRadius: BorderRadius.circular(30.0),
          shadowColor: Colors.lightBlueAccent.shade100,
          elevation: 5.0,
          color: Colors.lightBlue,
          child: MaterialButton(
              onPressed: sendData,

            child: Text("Sign Up",style: TextStyle(color: Colors.white),),
              )
        ),
      );
      final GoToLogin = MaterialButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/loginPage");
        },
        child: Text("Go to Login Page",
          style: new TextStyle(color: Colors.white)
        ),
      );

      return new Scaffold(
            body: new Stack(
          children: <Widget>[Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(image: AssetImage('assets/loginpage_img.jpeg'),fit: BoxFit.fill)
            ),
    ),
    new Center(
                child: new Form(
                  key: _formKey,
                child: ListView(
                  padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                  shrinkWrap: true,
                  children: <Widget>[logo_img,SizedBox(height: 50,),email,SizedBox(height: 30,), password,SizedBox(height: 30,),loginButton,SizedBox(height: 30,),GoToLogin],
                )
                )
              )
    ]
            )

      );


  }

}