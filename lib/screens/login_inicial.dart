import 'package:aproveitamento_de_estudos/models/user_model.dart';
import 'package:aproveitamento_de_estudos/screens/cadastro.dart';
import 'package:aproveitamento_de_estudos/screens/pagina_inicial.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>
with TickerProviderStateMixin{
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void initState(){
    super.initState();
  }
  Widget build(BuildContext context) {
SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    return new Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white,),
        child: ScopedModelDescendant<UserModel>(
          builder: (context, child, model){
            if (model.isLoading)
              return Center(child: CircularProgressIndicator(),);

            return Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 15.0, bottom: 35.0),
                        child: Column(
                          children: <Widget>[
                            Image.asset('images/logobict2.png', height: 100.0,),
                            Text(
                              "APROVEITAMENTO",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              "de Estudos",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 40.0),
                                child: Text('E-mail', style: TextStyle(color: Colors.grey, fontSize: 16.0),),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.withOpacity(0.5),
                                    width: 1.0,),
                                  borderRadius: BorderRadius.circular(20.0),),
                                margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                child: Row(
                                  children: <Widget>[
                                    new Padding(
                                      padding:
                                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                                      child: Icon(Icons.person_outline, color: Colors.grey,),),
                                    Container(
                                      height: 30.0,
                                      width: 1.0,
                                      color: Colors.grey.withOpacity(0.5),
                                      margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                                    ),
                                    new Expanded(
                                      child: TextFormField(
                                        controller: _emailController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Digite seu e-mail',
                                          hintStyle: TextStyle(color: Colors.grey),
                                        ),
                                        keyboardType: TextInputType.emailAddress,
                                        validator: (text){
                                          if (text.isEmpty || !text.contains('@')) return "E-mail inválido"; else return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],)
                      ),
                      Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 40.0),
                                child: Text('Senha',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16.0),),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.withOpacity(0.5),
                                    width: 1.0,),
                                  borderRadius: BorderRadius.circular(20.0),),
                                margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                child: Row(
                                  children: <Widget>[
                                    new Padding(
                                      padding:
                                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                                      child: Icon(Icons.lock_open, color: Colors.grey,),),
                                    Container(
                                      height: 30.0,
                                      width: 1.0,
                                      color: Colors.grey.withOpacity(0.5),
                                      margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                                    ),
                                    new Expanded(
                                      child: TextFormField(
                                        controller: _passController,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Digite sua senha',
                                          hintStyle: TextStyle(color: Colors.grey),
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
                            ],)
                      ),

                      // modo de cadastro antigo
                      /*
            InputField(
              hint: 'Email',
              icon: Icons.person_outline,
              obscure: false,
              hint2: 'Digite seu email',
            ),
            InputField(
              hint: 'Senha',
              icon: Icons.lock_open,
              obscure: true,
              hint2: 'Digite sua senha',
            ),*/

                      new Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 30.0),
                        alignment: Alignment.center,
                        child: new Row(
                          children: <Widget>[
                            new Expanded(
                              child: new FlatButton(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20.0,
                                    horizontal: 20.0),
                                color: Colors.greenAccent,
                                onPressed: () {
                                  if (_formKey.currentState.validate()){

                                  }
                                  model.signIn(
                                      email: _emailController.text,
                                      pass: _passController.text,
                                      onSuccess: _onSuccess,
                                      onFail: _onFail);
                                },
                                child: Text("Entrar",
                                  style: TextStyle(
                                      color: Colors.white),),
                              ),
                            ),
                          ],
                        ),
                      ),
                      new Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(
                            left: 40.0,
                            right: 40.0,
                            top: 10.0),
                        alignment: Alignment.center,
                        child: new Row(
                          children: <Widget>[
                            new Expanded(
                              child: new FlatButton(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20.0,
                                    horizontal: 20.0),
                                color: Colors.transparent,
                                onPressed: (){
                                  if(_emailController.text.isEmpty)
                                    _scaffoldKey.currentState.showSnackBar(
                                        SnackBar(content: Text("Insira seu e-mail para recuperação!"),
                                          backgroundColor: Colors.redAccent,
                                          duration: Duration(seconds: 2),)
                                    );
                                  else {
                                    model.recoverPass(_emailController.text);
                                    _scaffoldKey.currentState.showSnackBar(
                                        SnackBar(
                                          content: Text("Confira seu e-mail"),
                                          backgroundColor: Theme
                                              .of(context)
                                              .primaryColor,
                                          duration: Duration(seconds: 2),)
                                    );
                                  }
                                },
                                child: Text("Esqueceu a sua senha?",
                                  style: TextStyle(
                                      color: Colors.blue),),
                              ),
                            )
                          ],
                        ),
                      ),
                      new Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
                        alignment: Alignment.center,
                        child: Row(
                          children: <Widget>[
                            new Expanded(
                              child: new Container(
                                margin: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(border: Border.all(width: 0.25)),
                              ),
                            ),
                            Text("Ou conecte-se com",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,),
                            ),
                            new Expanded(
                              child: new Container(
                                margin: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    border: Border.all(width: 0.25)),
                              ),
                            )
                          ],
                        ),
                      ),
                      new Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
                        child: new Row(
                          children: <Widget>[
                            new Expanded(
                              child: new Container(
                                margin: EdgeInsets.only(right: 8.0),
                                alignment: Alignment.center,
                                child: new Row(
                                  children: <Widget>[
                                    new Expanded(
                                      child: new FlatButton(
                                        shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(30.0),
                                        ),
                                        color: Color(0Xff3B5998),
                                        onPressed: () => {},
                                        child: new Container(
                                          child: new Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              new Expanded(
                                                child:  new FlatButton(
                                                  onPressed: () => {},
                                                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0,),
                                                  child: new Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: <Widget>[
                                                      Text('Facebook',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.bold),),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),

                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            new Expanded(
                              child: new Container(
                                margin: EdgeInsets.only(left: 8.0),
                                alignment: Alignment.center,
                                child: new Row(
                                  children: <Widget>[
                                    new Expanded(
                                      child: new FlatButton(
                                        shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(30.0),
                                        ),
                                        color: Color(0Xffdb3236),
                                        onPressed: () => {},
                                        child: new Container(
                                          child: new Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              new Expanded(
                                                child: new FlatButton(
                                                  onPressed: () => {},
                                                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0,),
                                                  child: new Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: <Widget>[
                                                      Text('Google',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.bold),),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      new Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(
                            left: 40.0,
                            right: 40.0,
                            top: 10.0),
                        alignment: Alignment.center,
                        child: new Row(
                          children: <Widget>[
                            new Expanded(
                              child: new FlatButton(
                                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                                color: Colors.transparent,
                                onPressed: (){Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => SignUpScreen())
                                );
                                },
                                child: Text("Ainda não tem cadastro?",
                                  style: TextStyle(
                                      color: Colors.blue),),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
      ),
    );
  }

  void _onSuccess(){
    Navigator.pushReplacementNamed(context, 'HomeScreen');

  }

  void _onFail(){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("Falha ao entrar!"),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),)
    );
  }
  }


