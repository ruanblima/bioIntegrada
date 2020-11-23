import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:biointegrada/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'fase4.dart';

class Fase3 extends StatefulWidget {
  @override
  _Fase3State createState() => _Fase3State();
}

class _Fase3State extends State<Fase3> {
  List<DropdownMenuItem<String>> listDrop = [];
  String selected = null;

  int cont = 1;
  var caminhoImagem = "images/fase3/tecidoDosRins.jpg";

  void loadData() {
    listDrop = [];
    listDrop.add(new DropdownMenuItem(
      child: new Text("Figura 1"),
      value: "cerebro",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Figura 2"),
      value: "coracao",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Figura 3"),
      value: "intestinoFino",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Figura 4"),
      value: "osso",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Figura 5"),
      value: "pele",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Figura 6"),
      value: "pulmao",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Figura 7"),
      value: "rins",
    ));
  }

  void _trocarImagem() {
    setState(() {
      if (cont == 2) {
        caminhoImagem = "images/fase3/tecidoDoPulmao.png";
      } else if (cont == 3) {
        caminhoImagem = "images/fase3/tecidoDaPele.jpg";
      } else if (cont == 4) {
        caminhoImagem = "images/fase3/tecidoDoCoracao.jpg";
      } else if (cont == 5) {
        caminhoImagem = "images/fase3/tecidoDoIntestinoFino.png";
      } else if (cont == 6) {
        caminhoImagem = "images/fase3/tecidoDoOsso.jpg";
      } else if (cont == 7) {
        caminhoImagem = "images/fase3/tecidoDoCerebro.jpg";
      } else if (cont == 1) {
        caminhoImagem = "images/fase3/tecidoDosRins.jpg";
      }
    });
  }

  Future<void> _alertVoceAcertou(size) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Parabéns!",
            style: TextStyle(
                color: Colors.lightGreen,
                fontSize: _maxValue(size.width * 0.8, 20),
                fontFamily: "PoetsenOne"),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  "Você acertou, vamos para o próximo desafio.",
                  style: TextStyle(
                      color: Colors.lightGreen,
                      fontSize: _maxValue(size.width * 0.04, 15),
                      fontFamily: "SnigletRegular"),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton.icon(
              color: Colors.lightGreen,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                FontAwesomeIcons.solidWindowClose,
                color: Colors.white,
              ),
              label: Text(
                "Fechar",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: _maxValue(size.width * 0.08, 20),
                    fontFamily: "SnigletRegular"),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _alertVoceErrou(size) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Não foi dessa vez!',
            style: TextStyle(
                color: Colors.lightGreen,
                fontSize: _maxValue(size.width * 0.8, 20),
                fontFamily: "PoetsenOne"),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  "Você errou, vamos tentar mais uma vez.",
                  style: TextStyle(
                      color: Colors.lightGreen,
                      fontSize: _maxValue(size.width * 0.04, 15),
                      fontFamily: "SnigletRegular"),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton.icon(
              color: Colors.lightGreen,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                FontAwesomeIcons.solidWindowClose,
                color: Colors.white,
              ),
              label: Text(
                "Fechar",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: _maxValue(size.width * 0.08, 20),
                    fontFamily: "SnigletRegular"),
              ),
            ),
          ],
        );
      },
    );
  }

  onDoneLoading() async {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Fase4()));
  }

  Future<Timer> carregar() async {
    return new Timer(Duration(seconds: 1), onDoneLoading);
  }

  double _maxValue(double s, double max) {
    if (s < max) {
      return s;
    } else {
      return max;
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size size = mediaQuery.size;

    loadData();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: AutoSizeText(
          "BioIntegrada",
          style: TextStyle(color: Colors.white, fontFamily: "PoetsenOne"),
        ),
        actions: <Widget>[
          MaterialButton(
            onPressed: () {
              cont = 1;
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            child: Icon(
              FontAwesomeIcons.home,
              size: _maxValue(size.width * 0.09, 33),
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: _maxValue(size.width * 0.25, 85),
                      maxHeight: _maxValue(size.height * 0.25, 40),
                    ),
                    child: AutoSizeText(
                      "Fase 3",
                      style: TextStyle(
                          color: Colors.lightGreen,
                          fontSize: _maxValue(size.width * 0.09, 38),
                          fontFamily: "PoetsenOne"),
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
            //Row
            Padding(
              padding: EdgeInsets.all(5),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: size.width,
                  //maxHeight: _maxValue(size.height * 0.30, 200),
                ),
                child: AutoSizeText(
                  "Relacione a imagem do tecido com o seu orgão.",
                  style: TextStyle(
                      color: Colors.lightGreen,
                      fontSize: _maxValue(size.width * 0.1739, 25),
                      fontFamily: "SnigletRegular"),
                  maxLines: 2,
                ),
              ),
            ),
            //Row
            Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(),
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 15),
                              child: AutoSizeText(
                                "Figura 1",
                                style: TextStyle(
                                    color: Colors.lightGreen,
                                    fontSize: _maxValue(size.width * 0.02, 10),
                                    fontFamily: "PoetsenOne"),
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight: 47.36,
                                maxWidth: 64.8,
                              ),
                              child: Container(
                                child: Image.asset("images/fase3/cerebro.jpg",
                                    fit: BoxFit.cover,
                                    height: size.height * 0.08,
                                    width: size.width * 0.18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(bottom: 15),
                              child: AutoSizeText(
                                "Figura 2",
                                style: TextStyle(
                                    color: Colors.lightGreen,
                                    fontSize: _maxValue(size.width * 0.02, 10),
                                    fontFamily: "PoetsenOne"),
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxHeight: 47.36,
                                  maxWidth: 64.8,
                                ),
                                child: Container(
                                  child: Image.asset("images/fase3/coracao.png",
                                      fit: BoxFit.cover,
                                      height: size.height * 0.08,
                                      width: size.width * 0.18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(bottom: 15),
                              child: AutoSizeText(
                                "Figura 3",
                                style: TextStyle(
                                    color: Colors.lightGreen,
                                    fontSize: _maxValue(size.width * 0.02, 10),
                                    fontFamily: "PoetsenOne"),
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxHeight: 47.36,
                                  maxWidth: 64.8,
                                ),
                                child: Container(
                                  child: Image.asset(
                                      "images/fase3/intestinoFino.jpg",
                                      fit: BoxFit.cover,
                                      height: size.height * 0.08,
                                      width: size.width * 0.18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //Column
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: AutoSizeText(
                                "Figura 4",
                                style: TextStyle(
                                    color: Colors.lightGreen,
                                    fontSize: _maxValue(size.width * 0.02, 10),
                                    fontFamily: "PoetsenOne"),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 4),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxHeight: 71.03,
                                  maxWidth: 64.8,
                                ),
                                child: Container(
                                  child: Image.asset("images/fase3/osso.jpg",
                                      fit: BoxFit.cover,
                                      height: size.height * 0.10,
                                      width: size.width * 0.16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //Row
            Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //Column
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: AutoSizeText(
                                "Figura 5",
                                style: TextStyle(
                                    color: Colors.lightGreen,
                                    fontSize: _maxValue(size.width * 0.02, 10),
                                    fontFamily: "PoetsenOne"),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 4),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxHeight: 71.03,
                                  maxWidth: 64.8,
                                ),
                                child: Container(
                                  child: Image.asset("images/fase3/pele.jpg",
                                      fit: BoxFit.cover,
                                      height: size.height * 0.10,
                                      width: size.width * 0.18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //Column
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(bottom: 18),
                              child: AutoSizeText(
                                "Figura 6",
                                style: TextStyle(
                                    color: Colors.lightGreen,
                                    fontSize: _maxValue(size.width * 0.02, 10),
                                    fontFamily: "PoetsenOne"),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxHeight: 47.36,
                                  maxWidth: 64.8,
                                ),
                                child: Container(
                                  child: Image.asset("images/fase3/pulmao.jpg",
                                      fit: BoxFit.cover,
                                      height: size.height * 0.08,
                                      width: size.width * 0.18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //Column
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(bottom: 18),
                              child: AutoSizeText(
                                "Figura 7",
                                style: TextStyle(
                                    color: Colors.lightGreen,
                                    fontSize: _maxValue(size.width * 0.02, 10),
                                    fontFamily: "PoetsenOne"),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxHeight: 47.36,
                                  maxWidth: 72,
                                ),
                                child: Container(
                                  child: Image.asset("images/fase3/rins.jpg",
                                      fit: BoxFit.cover,
                                      height: size.height * 0.08,
                                      width: size.width * 0.2),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //Row
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 177.6,
                      maxWidth: 251.99,
                    ),
                    child: Container(
                      child: Image.asset(caminhoImagem,
                          fit: BoxFit.cover,
                          height: size.height * 0.30,
                          width: size.width * 0.70),
                    ),
                  ),
                ],
              ),
            ),
            //Row
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DropdownButton(
                    items: listDrop,
                    value: selected,
                    iconSize: _maxValue(size.width * 0.07, 25),
                    elevation: 16,
                    hint: AutoSizeText(
                      "Selecione uma opção",
                      style:
                          TextStyle(fontSize: _maxValue(size.width * 0.08, 20)),
                    ),
                    onChanged: (value) {
                      selected = value;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
            //Row
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(),
                    child: FlatButton(
                      color: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: _maxValue(size.width * 0.3, 120),
                          maxHeight: _maxValue(size.height * 0.05, 30),
                        ),
                        child: AutoSizeText(
                          "RETORNAR",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: _maxValue(size.width * 0.06, 21.59),
                              fontFamily: "SnigletRegular"),
                          maxLines: 1,
                        ),
                      ),
                      textColor: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.04),
                    child: FlatButton(
                      color: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      onPressed: () {
                        if (cont == 1) {
                          if (selected == "rins") {
                            cont++;
                            _alertVoceAcertou(size);
                            _trocarImagem();
                          } else {
                            _alertVoceErrou(size);
                          }
                        } else if (cont == 2) {
                          if (selected == "pulmao") {
                            cont++;
                            _alertVoceAcertou(size);
                            _trocarImagem();
                          } else {
                            _alertVoceErrou(size);
                          }
                        } else if (cont == 3) {
                          if (selected == "pele") {
                            cont++;
                            _alertVoceAcertou(size);
                            _trocarImagem();
                          } else {
                            _alertVoceErrou(size);
                          }
                        } else if (cont == 4) {
                          if (selected == "coracao") {
                            cont++;
                            _alertVoceAcertou(size);
                            _trocarImagem();
                          } else {
                            _alertVoceErrou(size);
                          }
                        } else if (cont == 5) {
                          if (selected == "intestinoFino") {
                            cont++;
                            _alertVoceAcertou(size);
                            _trocarImagem();
                          } else {
                            _alertVoceErrou(size);
                          }
                        } else if (cont == 6) {
                          if (selected == "osso") {
                            cont++;
                            _alertVoceAcertou(size);
                            _trocarImagem();
                          } else {
                            _alertVoceErrou(size);
                          }
                        } else if (cont == 7) {
                          if (selected == "cerebro") {
                            cont = 1;
                            _alertVoceAcertou(size);
                            _trocarImagem();
                            carregar();
                          } else {
                            _alertVoceErrou(size);
                          }
                        }
                      },
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: _maxValue(size.width * 0.3, 120),
                          maxHeight: _maxValue(size.height * 0.05, 30),
                        ),
                        child: AutoSizeText(
                          "  AVANÇAR  ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: _maxValue(size.width * 0.06, 21.59),
                              fontFamily: "SnigletRegular"),
                        ),
                      ),
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
