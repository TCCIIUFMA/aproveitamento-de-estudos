import 'package:cloud_firestore/cloud_firestore.dart';

class DisciplineData {

  String category;
  String id;
  String title;
  String code;
  String image;
  String content;
  String college;
  String curse;

  List titles;

  DisciplineData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    title = snapshot.data['title'];
    code = snapshot.data['code'];
    image = snapshot.data['image'];
    content = snapshot.data['content'];
    titles = snapshot.data['titles'];
    college = snapshot.data['college'];
    curse = snapshot.data['curse'];
  }

}