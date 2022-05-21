import 'package:flutter/material.dart';

import '../common/HttpResp.dart';
import '../common/httpHandler.dart';
import 'homeApp.dart';

void main(){

  runApp(MaterialApp(home: Login()));
}

class Login extends StatefulWidget{

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login>{

  late String _username;
  late String _password;
  HttpHandler hh = HttpHandler();

  void validKeys() {

      String jwt = "";
      hh.postToken(_username, _password).then((String result) {
        setState(() {
          jwt = result;
          print(jwt);
          Navigator.push(
            // Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => homeApp()),
          );
        });
      }).catchError((error) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(
              content: Text("Usuario o password incorrectos"),
              duration: Duration(seconds: 5),
            ));
      });
  }


  @override
  Widget build(BuildContext context){

    return Scaffold(
        appBar: AppBar(
          title: const Text("LOGIN CHARAGUA"),
          backgroundColor: Colors.deepPurple,
        ),
          backgroundColor: Colors.deepPurple[100],
        body:ListView(
          children: <Widget> [
            Column(
              children: [
                ClipRRect(
                  child: Image.asset('images/teatro.jpg'),
                ),
                // const Text(
                //     'LOGIN',
                //         style: TextStyle(
                //           fontSize: 40.0,
                //           // color: Colors.white
                //         )
                // ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                  children: <Widget>[TextField(
                    enableInteractiveSelection: false,
                    autofocus: true,
                    decoration: const InputDecoration(
                      hintText: 'username',
                      labelText: 'username',
                    ),
                    // onSubmitted: (value){
                    onChanged: (value){
                      _username = value;
                    },
                  ),
                  TextField(
                    enableInteractiveSelection: false,
                    obscureText: true,
                    autofocus: true,
                    decoration: const InputDecoration(
                        hintText: 'password',
                        labelText: 'password'
                    ),
                    // onSubmitted: (value){
                    onChanged: (value){
                      _password = value;
                    },
                  )],
                  )
                ),
                ElevatedButton(onPressed: (){
                  validKeys();
                },
                    child: const Text('Ingresar'))
              ],
            )
          ],
        )
    );
  }
}