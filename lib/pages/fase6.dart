import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:biointegrada/main.dart';
import 'package:biointegrada/pages/fase6b.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Fase6 extends StatefulWidget {
  @override
  _Fase6State createState() => _Fase6State();
}

class _Fase6State extends State<Fase6> {
  List<DropdownMenuItem<String>> listDrop = [];
  String selected = null;

  int cont = 1;
  var caminhoImagem = "images/fase6/amebiase.jpg";

  void loadData() {
    listDrop = [];
    listDrop.add(new DropdownMenuItem(
      child: new Text("Ancilostomose ou Amarelão"),
      value: "ancilostomoseOuAmarelao",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Ascaridíase"),
      value: "ascaridiase",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Giardíase"),
      value: "giardiase",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Oxiuríase ou Enterobíase"),
      value: "oxiuriaseOuEnterobiase",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Teníase e Cisticercose"),
      value: "teniaseECisticercose",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Amebíase"),
      value: "amebiase",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Esquistossomose"),
      value: "esquistossomose",
    ));
  }

  void _trocarImagem() {
    setState(() {
      if (cont == 2) {
        caminhoImagem = "images/fase6/ancilostomoseOuAmarelao.jpg";
      } else if (cont == 3) {
        caminhoImagem = "images/fase6/ascaridiase.jpg";
      } else if (cont == 4) {
        caminhoImagem = "images/fase6/teniaseECisticercose.jpg";
      } else if (cont == 1) {
        caminhoImagem = "images/fase6/amebiase.jpg";
      }
    });
  }

  void _alertVoceAcertou(size) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: AutoSizeText(
            "Parabéns!",
            style: TextStyle(
                color: Colors.lightGreen,
                fontSize: _maxValue(size.width * 0.8, 20),
                fontFamily: "PoetsenOne"),
            maxLines: 1,
          ),
          content: AutoSizeText(
            "Você acertou, vamos para o próximo desafio.",
            style: TextStyle(
                color: Colors.lightGreen,
                fontSize: _maxValue(size.width * 0.04, 15),
                fontFamily: "SnigletRegular"),
          ),
          actions: <Widget>[
            new FlatButton.icon(
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
              label: AutoSizeText(
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

  void _alertVoceErrou(size) {
    print(size.width * 0.04);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: AutoSizeText(
            "Não foi dessa vez!",
            style: TextStyle(
                color: Colors.lightGreen,
                fontSize: _maxValue(size.width * 0.8, 20),
                fontFamily: "PoetsenOne"),
            maxLines: 1,
          ),
          content: AutoSizeText(
            "Você errou, vamos tentar mais uma vez.",
            style: TextStyle(
                color: Colors.lightGreen,
                fontSize: _maxValue(size.width * 0.04, 15),
                fontFamily: "SnigletRegular"),
          ),
          actions: <Widget>[
            new FlatButton.icon(
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
              label: AutoSizeText(
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
        .push(MaterialPageRoute(builder: (context) => Fase6b()));
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
                      "Fase 6",
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
                  "Analise as imagens e classifique a qual ciclo de verminose está relacionada.",
                  style: TextStyle(
                      color: Colors.lightGreen,
                      fontSize: _maxValue(size.width * 0.0439, 16),
                      fontFamily: "SnigletRegular"),
                  maxLines: 2,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 266.4,
                      maxWidth: 345.59,
                    ),
                    child: Container(
                      child: Image.asset(caminhoImagem,
                          fit: BoxFit.cover,
                          height: size.height * 0.45,
                          width: size.width * 0.96),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.02),
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
              padding: EdgeInsets.only(top: size.height * 0.04),
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
                          if (selected == "amebiase") {
                            cont++;
                            _alertVoceAcertou(size);
                            _trocarImagem();
                          } else {
                            _alertVoceErrou(size);
                          }
                        } else if (cont == 2) {
                          if (selected == "ancilostomoseOuAmarelao") {
                            cont++;
                            _alertVoceAcertou(size);
                            _trocarImagem();
                          } else {
                            _alertVoceErrou(size);
                          }
                        } else if (cont == 3) {
                          if (selected == "ascaridiase") {
                            cont++;
                            _alertVoceAcertou(size);
                            _trocarImagem();
                          } else {
                            _alertVoceErrou(size);
                          }
                        } else if (cont == 4) {
                          if (selected == "teniaseECisticercose") {
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
