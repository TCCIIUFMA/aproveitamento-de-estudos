import 'dart:async';
import 'package:aproveitamento_de_estudos/models/user_model.dart';
import 'package:aproveitamento_de_estudos/screens/login_inicial.dart';
import 'package:aproveitamento_de_estudos/screens/pagina_inicial.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>{

  final _nameController = TextEditingController();
  final _faculdadeController = TextEditingController();
  final _cursoController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: ScopedModelDescendant<UserModel>(
            builder: (context, child, model){
              if(model.isLoading)
                return Center(child: CircularProgressIndicator(),);
              return Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 45.0, bottom: 35.0),
                      child: new Column(
                        children: <Widget>[
                          Text(
                            "CADASTRO DE USUÁRIO",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          new Row(
                            children: <Widget>[
                              new Expanded(
                                child: new Padding(
                                  padding:
                                  const EdgeInsets.only(left: 40.0, top: 20.0),
                                  child: new Text(
                                    "Nome Completo",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.redAccent,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          new Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(left: 40.0, right: 40.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: Colors.redAccent,
                                    width: 0.5,
                                    style: BorderStyle.solid),
                              ),
                            ),
                            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                new Expanded(
                                  child: TextFormField(
                                    controller: _nameController,
                                    textAlign: TextAlign.left,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    validator: (text){
                                      if (text.isEmpty) return "Nome inválido"; else return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          new Row(
                            children: <Widget>[
                              new Expanded(
                                child: new Padding(
                                  padding:
                                  const EdgeInsets.only(left: 40.0, top: 15.0),
                                  child: new Text(
                                    "Faculdade",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.redAccent,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          new Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(left: 40.0, right: 40.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: Colors.redAccent,
                                    width: 0.5,
                                    style: BorderStyle.solid),
                              ),
                            ),
                            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                new Expanded(
                                  child: TextFormField(
                                    controller: _faculdadeController,
                                    textAlign: TextAlign.left,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    validator: (text){
                                      if (text.isEmpty) return "Faculdade inválida"; else return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          new Row(
                            children: <Widget>[
                              new Expanded(
                                child: new Padding(
                                  padding:
                                  const EdgeInsets.only(left: 40.0, top: 15.0),
                                  child: new Text(
                                    "Curso",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.redAccent,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          new Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(left: 40.0, right: 40.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: Colors.redAccent,
                                    width: 0.5,
                                    style: BorderStyle.solid),
                              ),
                            ),
                            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                new Expanded(
                                  child: TextFormField(
                                    controller: _cursoController,
                                    textAlign: TextAlign.left,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    validator: (text){
                                      if (text.isEmpty) return "Curso inválido"; else return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          new Row(
                            children: <Widget>[
                              new Expanded(
                                child: new Padding(
                                  padding:
                                  const EdgeInsets.only(left: 40.0, top: 15.0),
                                  child: new Text(
                                    "Email",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.redAccent,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          new Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(left: 40.0, right: 40.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: Colors.redAccent,
                                    width: 0.5,
                                    style: BorderStyle.solid),
                              ),
                            ),
                            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                new Expanded(
                                  child: TextFormField(
                                    controller: _emailController,
                                    textAlign: TextAlign.left,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    validator: (text){
                                      if (text.isEmpty || !text.contains('@')) return "E-mail inválido"; else return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          new Row(
                            children: <Widget>[
                              new Expanded(
                                child: new Padding(
                                  padding:
                                  const EdgeInsets.only(left: 40.0, top: 15.0),
                                  child: new Text(
                                    "Senha",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.redAccent,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          new Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(left: 40.0, right: 40.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: Colors.redAccent,
                                    width: 0.5,
                                    style: BorderStyle.solid),
                              ),
                            ),
                            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                new Expanded(
                                  child: TextFormField(
                                    controller: _passController,
                                    obscureText: true,
                                    textAlign: TextAlign.left,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    validator: (text){
                                      if (text.isEmpty || text.length <6)
                                        return "Senha inválida";
                                      else
                                        return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          new Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(
                                left: 70.0, right: 70.0, top: 40.0),
                            alignment: Alignment.center,
                            child: new Row(
                              children: <Widget>[
                                new Expanded(
                                  child: new FlatButton(
                                    shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(30.0),
                                    ),
                                    color: Colors.greenAccent,
                                    onPressed: (){
                                      if(_formKey.currentState.validate()){

                                        Map<String, dynamic> userData = {
                                          "name": _nameController.text,
                                          "faculdade": _faculdadeController.text,
                                          "curso": _cursoController.text,
                                          "email": _emailController.text,
                                        };

                                        model.signUp(
                                            userData: userData,
                                            pass: _passController.text,
                                            onSuccess: _onSuccess,
                                            onFail: _onFail);

                                      }
                                    },

                                    child: new Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 20.0,
                                        horizontal: 20.0,
                                      ),
                                      child: new Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          new Expanded(
                                            child: Text(
                                              "Confirmar cadastro",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          new Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(
                                left: 80.0, right: 80.0, top: 20.0),
                            alignment: Alignment.center,
                            child: new Row(
                              children: <Widget>[
                                new Expanded(
                                  child: new FlatButton(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20.0, horizontal: 20.0),
                                    color: Colors.transparent,
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) => Login()));
                                    },
                                    child: Text(
                                      "Já tem cadastro?",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ),
      ),
    );
  }


  void _onSuccess(){
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(content: Text("Usuário criado com sucesso!"),
      backgroundColor: Theme.of(context).primaryColor,
      duration: Duration(seconds: 2),)
    );
    Future.delayed(Duration(seconds: 2)).then((_){
      Navigator.pushReplacementNamed(context, 'HomeScreen');

    });

  }

  void _onFail(){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("Falha ao criar o usuário!"),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),)
    );
  }
}
