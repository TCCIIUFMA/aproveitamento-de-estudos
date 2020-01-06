import 'package:aproveitamento_de_estudos/models/ementa_model.dart';
import 'package:aproveitamento_de_estudos/models/user_model.dart';
import 'package:aproveitamento_de_estudos/tiles/cart_tile.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CalcEmenta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ementa da disciplina"),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 8.0),
            alignment: Alignment.center,
            child: ScopedModelDescendant<EmentaModel>(
              builder: (context,child, model){
                int p = model.disciplinas.length;
                return Text(
                  "${p ?? 0} ${p == 1 ? "TÓPICO" : "TÓPICOS"}",
                );
              },
            )
          )
        ],
      ),
      body: ScopedModelDescendant<EmentaModel>(
          builder: (context, child, model){
            if (model.disciplinas == null || model.disciplinas.length == 0){
              return Center(
                child: Text("Nenhuma disciplina adicionada!",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,),
              );
            } else {
              return ListView(
                children: <Widget>[
                  Column(
                    children: model.disciplinas.map(
                        (disciplina){
                          return CardTile(disciplina);
                        }
                    ).toList()
                  ), SizedBox(height: 20.0,),
                  FlatButton(onPressed: (){},
                    child: Text(
                        "Calcular", style: TextStyle(color: Colors.white),),
                    color: Colors.green,
                    padding: EdgeInsets.all(15.0),
                  )
                ],
              );
            }
          }),
    );
  }
}
