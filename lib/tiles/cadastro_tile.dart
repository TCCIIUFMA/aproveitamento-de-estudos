import 'package:aproveitamento_de_estudos/datas/discipline_data.dart';
import 'package:flutter/material.dart';

class CadastroTile extends StatefulWidget {

  final DisciplineData data;
  CadastroTile(this.data);


  @override
  _CadastroTileState createState() => _CadastroTileState();
}

class _CadastroTileState extends State<CadastroTile> {


  final _nameController = TextEditingController();
  final _faculdadeController = TextEditingController();
  final _cursoController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Form(
                  key: _formKey,
                  child: ListView(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 45.0, bottom: 35.0),
                        child: new Column(
                          children: <Widget>[
                            Text(
                              "CADASTRO DE DISCIPLINA",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24.0,
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
                                      "Disciplina de origem",
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
                                        if (text.isEmpty) return "Disciplina inválida"; else return null;
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
                                      "Disciplina cursada",
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
                                        if (text.isEmpty) return "Disciplina inválida"; else return null;
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
                                      "Faculdade onde foi cursado ",
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
                                      "Curso onde foi cursado",
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
                                      "Código da disciplina cursada",
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
                                      textAlign: TextAlign.left,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                      validator: (text){
                                        if (text.isEmpty)
                                          return "Código inválido";
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
                                                "Cadastrar disciplina",
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
                          ],
                        ),
                      ),
                    ],
                  ))));
  }



}
