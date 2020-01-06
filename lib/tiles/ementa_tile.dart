import 'package:aproveitamento_de_estudos/datas/discipline_data.dart';
import 'package:aproveitamento_de_estudos/datas/ementa_data.dart';
import 'package:aproveitamento_de_estudos/models/ementa_model.dart';
import 'package:flutter/material.dart';

class EmentaTiles extends StatefulWidget {

  final DisciplineData data;
  EmentaTiles(this.data);

  @override
  _EmentaTilesState createState() => _EmentaTilesState();

}
class _EmentaTilesState extends State<EmentaTiles> {

  @override

  Widget build(BuildContext context) {

    return Card(
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: LimitedBox(
                maxHeight: 48,
                child: Row(
                  children: [
                    SizedBox(width: 24),
                    Expanded(
                      child: Text(widget.data.title),
                    ),
                    SizedBox(width: 24),
                    FlatButton(
                        onPressed: (){
                      EmentaData ementaData = EmentaData();
                      ementaData.title = widget.data.title;
                      ementaData.eid = widget.data.id;
                      ementaData.category = widget.data.category;

                      EmentaModel.of(context).addEmentaItem(ementaData);
                    },
                        child: Icon(
                            Icons.check)
              )
            ],
          ),
        ),
      )
          ],
        ),
      ),
    );
  }
}


/*
Card(
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
 */