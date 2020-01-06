import 'package:aproveitamento_de_estudos/datas/discipline_data.dart';
import 'package:aproveitamento_de_estudos/tiles/cadastro_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CadastroDisciplines extends StatefulWidget {
  @override
  _CadastroDisciplinesState createState() => _CadastroDisciplinesState();
}

class _CadastroDisciplinesState extends State<CadastroDisciplines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Cadastro de disciplina"),
      ),
      body: FutureBuilder<QuerySnapshot>(
          future: Firestore.instance.collection("disciplinas").getDocuments(),
          builder: (context,snapshot){
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator(),);
            else
              return ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  itemCount: snapshot.data.documents.length,
                  itemBuilder:(context,index) {
                    DisciplineData data = DisciplineData.fromDocument(snapshot.data.documents[index]);
                    return CadastroTile(data);
                  }
              ); }),

    );
  }
}
