import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:biointegrada/main.dart';
import 'package:biointegrada/pages/fase5.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Fase4 extends StatefulWidget {
  @override
  _Fase4State createState() => _Fase4State();
}

class _Fase4State extends State<Fase4> {
  List<DropdownMenuItem<String>> listDrop = [];
  String selected = null;

  int cont = 1;
  var caminhoImagem = "images/fase4/esqueletico.jpeg";

  void loadData() {
    listDrop = [];
    listDrop.add(new DropdownMenuItem(
      child: new Text("Sistema Cardiovascular"),
      value: "sistemaCardiovascular",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Sistema Excretor"),
      value: "sistemaExcretor",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Sistema Digestório"),
      value: "sistemaDigestorio",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Sistema Respiratório"),
      value: "sistemaRespiratorio",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Sistema Endócrino"),
      value: "sistemaEndocrino",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Sistema Muscular"),
      value: "sistemaMuscular",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Sistema Esquelético"),
      value: "sistemaEsqueletico",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Sistema Imunológico"),
      value: "sistemaImunologico",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Sistema Linfático"),
      value: "sistemaLinfatico",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Sistema Nervoso"),
      value: "sistemaNervoso",
    ));
  }

  void _trocarImagem() {
    setState(() {
      if (cont == 2) {
        caminhoImagem = "images/fase4/sistemaCardiovascular.jpg";
      } else if (cont == 3) {
        caminhoImagem = "images/fase4/sistemaDigestorio.jpeg";
      } else if (cont == 4) {
        caminhoImagem = "images/fase4/sistemaEndocrino.jpeg";
      } else if (cont == 5) {
        caminhoImagem = "images/fase4/sistemaExcretor.jpg";
      } else if (cont == 6) {
        caminhoImagem = "images/fase4/sistemaLinfatico.png";
      } else if (cont == 7) {
        caminhoImagem = "images/fase4/sistemaMuscular.jpg";
      } else if (cont == 8) {
        caminhoImagem = "images/fase4/sistemaNervoso.jpeg";
      } else if (cont == 9) {
        caminhoImagem = "images/fase4/sistemaRespiratorio.jpeg";
      } else if (cont == 10) {
        caminhoImagem = "images/fase4/sistemaImunologico.png";
      } else if (cont == 1) {
        caminhoImagem = "images/fase4/esqueletico.jpeg";
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
        .push(MaterialPageRoute(builder: (context) => Fase5()));
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
              padding: EdgeInsets.only(top: size.height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: _maxValue(size.width * 0.25, 85),
                      maxHeight: _maxValue(size.height * 0.25, 40),
                    ),
                    child: AutoSizeText(
                      "Fase 4",
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
            Padding(
              padding: EdgeInsets.all(5),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: size.width,
                  //maxHeight: _maxValue(size.height * 0.30, 200),
                ),
                child: AutoSizeText(
                  "Analise as imagens e escolha a opção que corresponde a seu respectivo sistema.",
                  style: TextStyle(
                      color: Colors.lightGreen,
                      fontSize: _maxValue(size.width * 0.0439, 16),
                      fontFamily: "SnigletRegular"),
                  maxLines: 3,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 307.84,
                      maxWidth: 133.2,
                    ),
                    child: Container(
                      child: Image.asset(caminhoImagem,
                          fit: BoxFit.cover,
                          height: size.height * 0.52,
                          width: size.width * 0.37),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DropdownButton(
                    items: listDrop,
                    value: selected,
                    iconSize: _maxValue(size.width * 0.05, 22),
                    elevation: 16,
                    hint: AutoSizeText(
                      "Selecione uma opção",
                      style:
                          TextStyle(fontSize: _maxValue(size.width * 0.04, 15)),
                    ),
                    onChanged: (value) {
                      selected = value;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.01),
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
                          if (selected == "sistemaEsqueletico") {
                            cont++;
                            _alertVoceAcertou(size);
                            _trocarImagem();
                          } else {
                            _alertVoceErrou(size);
                          }
                        } else if (cont == 2) {
                          if (selected == "sistemaCardiovascular") {
                            cont++;
                            _alertVoceAcertou(size);
                            _trocarImagem();
                          } else {
                            _alertVoceErrou(size);
                          }
                        } else if (cont == 3) {
                          if (selected == "sistemaDigestorio") {
                            cont++;
                            _alertVoceAcertou(size);
                            _trocarImagem();
                          } else {
                            _alertVoceErrou(size);
                          }
                        } else if (cont == 4) {
                          if (selected == "sistemaEndocrino") {
                            cont++;
                            _alertVoceAcertou(size);
                            _trocarImagem();
                          } else {
                            _alertVoceErrou(size);
                          }
                        } else if (cont == 5) {
                          if (selected == "sistemaExcretor") {
                            cont++;
                            _alertVoceAcertou(size);
                            _trocarImagem();
                          } else {
                            _alertVoceErrou(size);
                          }
                        } else if (cont == 6) {
                          if (selected == "sistemaLinfatico") {
                            cont++;
                            _alertVoceAcertou(size);
                            _trocarImagem();
                          } else {
                            _alertVoceErrou(size);
                          }
                        } else if (cont == 7) {
                          if (selected == "sistemaMuscular") {
                            cont++;
                            _alertVoceAcertou(size);
                            _trocarImagem();
                          } else {
                            _alertVoceErrou(size);
                          }
                        } else if (cont == 8) {
                          if (selected == "sistemaNervoso") {
                            cont++;
                            _alertVoceAcertou(size);
                            _trocarImagem();
                          } else {
                            _alertVoceErrou(size);
                          }
                        } else if (cont == 9) {
                          if (selected == "sistemaRespiratorio") {
                            cont++;
                            _alertVoceAcertou(size);
                            _trocarImagem();
                          } else {
                            _alertVoceErrou(size);
                          }
                        } else if (cont == 10) {
                          if (selected == "sistemaImunologico") {
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
