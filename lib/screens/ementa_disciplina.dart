import 'package:aproveitamento_de_estudos/datas/discipline_data.dart';
import 'package:aproveitamento_de_estudos/screens/calc_ementa.dart';
import 'package:aproveitamento_de_estudos/tiles/ementa_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EmentaDisciplina extends StatelessWidget {

  final DisciplineData data;
  EmentaDisciplina(this.data);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ementa da disciplina"),
          actions: <Widget>[FlatButton(onPressed:(){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CalcEmenta()));
          } , child: Icon(Icons.arrow_forward))],
        ),
        body: FutureBuilder<QuerySnapshot>(
            future: Firestore.instance.collection("disciplinas").document(data.id)
                .collection("ementa").getDocuments(),
            builder: (context,snapshot){
              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator(),);
              else
                return ListView.builder(
                    padding: EdgeInsets.all(8.0),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder:(context,index) {
                      DisciplineData data = DisciplineData.fromDocument(snapshot.data.documents[index]);
                      data.category = this.data.id;
                      return EmentaTiles(data);
                    }
                ); }),
                    );
    }
  }



/*
class EmentaDisciplina extends StatefulWidget {

  final DisciplineData data;
  EmentaDisciplina(this.data);

  @override
  _EmentaDisciplinaState createState() => _EmentaDisciplinaState();
}

class _EmentaDisciplinaState extends State<EmentaDisciplina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ementa da disciplina"),
        ),
        body: FutureBuilder<QuerySnapshot>(
            future: Firestore.instance.collection("disciplinas").document(widget.data.id)
                .collection("ementa").getDocuments(),
            builder: (context,snapshot){
              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator(),);
              else
                return ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  itemCount: snapshot.data.documents.length,
                  itemBuilder:(context,index){
                    return EmentaTiles(DisciplineData.fromDocument(snapshot.data.documents[index]));

                  },
                );

            }));
  }
}

class EmentaTiles extends StatefulWidget {

  final DisciplineData data;
  EmentaTiles(this.data);

  @override
  _EmentaTilesState createState() => _EmentaTilesState();

}
class _EmentaTilesState extends State<EmentaTiles> {

  void onChange(bool val){
    setState(() {
      values = val;

    });
  }

  bool values = false;

  @override

  Widget build(BuildContext context) {

    return Card(
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: <Widget>[
            CheckboxListTile(
                value: values,
                title: Text(widget.data.title),
                onChanged: (bool val) {
                  onChange(val);
                }),
          ],
        ),
      ),
    );
  }
}
*/

/*
class EmentaDisciplina extends StatelessWidget {

  final DisciplineData data;
  EmentaDisciplina(this.data);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ementa da disciplina"),
        ),
        body: FutureBuilder<QuerySnapshot>(
            future: Firestore.instance.collection("disciplinas").document(data.id)
                .collection("ementa").getDocuments(),
            builder: (context,snapshot){
              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator(),);
              else
                return ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  itemCount: snapshot.data.documents.length,
                  itemBuilder:(context,index){
                    return EmentaTiles(DisciplineData.fromDocument(snapshot.data.documents[index]));

                  },
                  );

    }));
}}
*/


/*
class EmentaDisciplina extends StatefulWidget {

  final DisciplineData data;
  EmentaDisciplina(this.data);


  @override

  _EmentaDisciplinaState createState() => _EmentaDisciplinaState();
}

class _EmentaDisciplinaState extends State<EmentaDisciplina> {

  bool _sel = false;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ementa da disciplina"),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: Firestore.instance.collection("disciplinas").document(data.id)
            .collection("ementa").getDocuments(),
        builder: (context,snapshot){
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator(),);
          else
            return ListView(padding: EdgeInsets.all(8.0),
              children: <Widget>[
                new Text(data.title),
                new Checkbox(
                  onChanged: (bool resp){
                    setState((){
                      _sel = resp;
                    });
                  },
                  value: _sel,
                )

              ],);
        },
      ),
    );
  }
}
*/

/*
class EmentaDisciplina extends StatelessWidget {

  final DisciplineData data;
  EmentaDisciplina(this.data);

  @override
  bool _sel = false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ementa da disciplina"),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: Firestore.instance.collection("disciplinas").document(data.id)
            .collection("ementa").getDocuments(),
        builder: (context,snapshot){
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator(),);
          else
            return ListView(padding: EdgeInsets.all(8.0),
              children: <Widget>[
                new Text(data.title),
                new Checkbox(
                  onChanged: (bool resp){
                    setState((){
                      _sel = resp;
                    });
                  },
                  value: _sel,
                )

              ],);
        },
      ),
    );
  }
} */


/*
class EmentaDisciplina extends StatefulWidget {

  final DisciplineData data;
  EmentaDisciplina(this.data);

  @override
  _EmentaDisciplinaState createState() => _EmentaDisciplinaState();
}

class _EmentaDisciplinaState extends State<EmentaDisciplina> {
  bool title = false;
  List<String> _texts = [
    "InduceSmile.com," "Flutter.io",
    "google.com",
    "youtube.com",
    "yahoo.com",
    "gmail.com"
  ];

  @override
final data = Firestore.instance.collection("disciplinas").document(data);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ementa da disciplina"),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: Firestore.instance.collection("disciplinas").document(data.id)
            .collection("ementa").getDocuments(),
        builder: (context,snapshot){
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator(),);
          else
            return ListView(padding: EdgeInsets.all(8.0),
              children: _texts.map((text) => CheckboxListTile(
                title: Text(text),
                value: title,
                onChanged: (bool val) {
                  setState(() {
                    title = val;

                  });
                },
              )).toList(),);
        },
      )



        /*ListView(
        padding: EdgeInsets.all(8.0),
        children: _texts.map((text) => CheckboxListTile(
          title: Text(text),
          value: title,
          onChanged: (bool val) {
            setState(() {
              title = val;

            });
          },
        )).toList(),
      ), */
    );
  }
} */
