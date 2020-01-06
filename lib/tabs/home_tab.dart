import 'package:aproveitamento_de_estudos/animation/animation_home.dart';
import 'package:aproveitamento_de_estudos/screens/cadastro_disciplines.dart';
import 'package:aproveitamento_de_estudos/screens/category_disciplines.dart';

import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with SingleTickerProviderStateMixin {
  double _scale;
  AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;

    return PageView(
      children: <Widget>[
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 50.0,
                    ),
                    new Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new AssetImage("images/logobict2.png"))),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    DelayedAnimation(
                      child: Text(
                        "Aproveitamento",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35.0,
                            color: Colors.black),
                      ),
                      delay: 1500,
                    ),
                    DelayedAnimation(
                      child: Text(
                        "de Estudos",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35.0,
                            color: Colors.black),
                      ),
                      delay: 2500,
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    DelayedAnimation(
                      child: Text(
                        "O que você deseja?",
                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                      ),
                      delay: 3500,
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                    DelayedAnimation(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Category()));
                        },
                        child: Transform.scale(
                          scale: _scale,
                          child: Container(
                            height: 60,
                            width: 270,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                'Lista de disciplinas',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      delay: 4500,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    DelayedAnimation(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CadastroDisciplines()));
                        },
                        child: Transform.scale(
                          scale: _scale,
                          child: Container(
                            height: 60,
                            width: 270,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                'Cadastrar disciplina',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      delay: 4500,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
