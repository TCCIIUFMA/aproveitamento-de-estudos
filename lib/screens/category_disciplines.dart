import 'package:aproveitamento_de_estudos/datas/discipline_data.dart';
import 'package:aproveitamento_de_estudos/tiles/category_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    final makeBody = FutureBuilder<QuerySnapshot>(
     future: Firestore.instance.collection("disciplinas").getDocuments(),
     builder: (context,snapshot){
       if (!snapshot.hasData)
         return Center(
           child: CircularProgressIndicator(),
         );
       else {
         return Container(
           child: GridView.builder(
               padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 60.0),
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 1,
               ),
               itemCount: snapshot.data.documents.length,
               itemBuilder: (context, index){

                 return CategoryTile(DisciplineData.fromDocument(snapshot.data.documents[index]));}
       ),);
       }
     },
    );


    final topAppBar = AppBar(
      elevation: 0.9,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.black,
        onPressed: (){Navigator.of(context).pop();},),
      title: Text('Disciplinas',
        style: TextStyle(color: Colors.black),),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.search),
            color: Colors.black,
            onPressed: (){}),
      ],
    );

    return Scaffold(
      backgroundColor: Color.fromARGB(255,255,255,255),
      appBar: topAppBar,
      body: makeBody,



    );

  }
}
