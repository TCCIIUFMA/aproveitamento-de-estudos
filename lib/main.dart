import 'package:aproveitamento_de_estudos/models/ementa_model.dart';
import 'package:aproveitamento_de_estudos/models/user_model.dart';
import 'package:aproveitamento_de_estudos/screens/pagina_inicial.dart';
import 'package:flutter/material.dart';
import 'package:aproveitamento_de_estudos/screens/login_inicial.dart';
import 'package:scoped_model/scoped_model.dart';
import 'precarregamento.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
        child: ScopedModelDescendant<UserModel>(
            builder: (context, child, model){
              return ScopedModel<EmentaModel>(
                model: EmentaModel(model),
                  child: MaterialApp(
                    title: 'Aproveitamento de Estudos',
                    debugShowCheckedModeBanner: false,
                    home: new SplashPage(),
                    routes: <String, WidgetBuilder>{
                      '/Login': (BuildContext context) => new Login(),
                      'HomeScreen':(context) => HomeScreen(),
                    },
                  ),
              );
            } )
    );
  }
}
