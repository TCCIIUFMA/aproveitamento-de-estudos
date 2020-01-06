import 'package:aproveitamento_de_estudos/datas/discipline_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EmentaData{

  String did;
  String category;
  String eid;
  String title;

  DisciplineData disciplineData;

  EmentaData();

  EmentaData.fromDocument(DocumentSnapshot document){
    did = document.documentID;
    category = document.data["category"];
    eid = document.data["eid"];
    title = document.data["title"];
  }

  Map<String, dynamic> toMap(){
    return{
      "did": did,
      "category": category,
      "eid": eid,
      "title": title,

    };
  }

}