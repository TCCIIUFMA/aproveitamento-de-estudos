import 'package:aproveitamento_de_estudos/screens/category_disciplines.dart';
import 'package:aproveitamento_de_estudos/tabs/home_tab.dart';
import 'package:aproveitamento_de_estudos/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
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
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Stack(
          children: <Widget>[
            _buildBodyBack(),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                /*title: Text("Aproveitamento de estudos"),*/
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                centerTitle: true,
              ),
              body: HomeTab(),
              drawer: CustomDrawer(_pageController),
            ),
          ],
        ),
        Scaffold(
          body: Category(),
        ),



      ],

    );

  }
}


