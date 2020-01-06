
import 'package:flutter/material.dart';
import 'package:aproveitamento_de_estudos/datas/ementa_data.dart';
import 'package:aproveitamento_de_estudos/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scoped_model/scoped_model.dart';

class EmentaModel extends Model{
  UserModel user;

  List<EmentaData> disciplinas = [];

  bool isLoading = false;

  EmentaModel(this.user);

  static EmentaModel of(BuildContext context) =>
      ScopedModel.of<EmentaModel>(context);

  void addEmentaItem(EmentaData ementaData){
    disciplinas.add(ementaData);

    Firestore.instance.collection("users").document(user.firebaseUser.uid).
    collection("ementas").add(ementaData.toMap()).then((doc){
      ementaData.did = doc.documentID;
    });

    notifyListeners();
  }

  void removeEmentaItem(EmentaData ementaData){
    Firestore.instance.collection("users").document(user.firebaseUser.uid).
    collection("ementas").document(ementaData.did).delete();

    disciplinas.remove(ementaData);

    notifyListeners();

  }

}