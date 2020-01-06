
import 'package:aproveitamento_de_estudos/models/user_model.dart';
import 'package:aproveitamento_de_estudos/screens/login_inicial.dart';
import 'package:aproveitamento_de_estudos/tiles/drawer_tile.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';


class CustomDrawer extends StatelessWidget {

  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 173, 216, 230),
                Color.fromARGB(255, 255, 255, 255)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
          )
      ),
    );
    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 100.0,
                child: Stack(
                  children: <Widget>[

                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: ScopedModelDescendant<UserModel>(
                        builder: (context, child, model){
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("${!model.isLoggedIn() ? "" :model.userData["name"]}",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),),

                              GestureDetector(
                                child: Text(
                                  !model.isLoggedIn() ?
                                  "Entre ou cadastre-se"
                                  : "Sair",
                                  style: TextStyle(
                                      color: Colors.lightBlue,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                onTap: (){
                                  if(!model.isLoggedIn())
                                    Navigator.pushReplacementNamed(context, '/Login');
                                  else
                                    model.signOut();
                                },
                              )

                            ],
                          );
                        }
                      )
                    )
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.home, 'Página inicial', pageController, 0, ),
              DrawerTile(Icons.list,'Disciplinas', pageController, 1, ),
              DrawerTile(Icons.add, 'Cadastrar disciplinas', pageController, 2, ),
              DrawerTile(Icons.build, 'Configurações', pageController, 3, )
            ],
          )
        ],
      ),
    );
  }
}
