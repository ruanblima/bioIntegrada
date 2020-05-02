import 'dart:async';

import 'package:biointegrada/main.dart';
import 'package:biointegrada/pages/fase7.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Fase6b extends StatefulWidget {
  @override
  _Fase6bState createState() => _Fase6bState();
}

class _Fase6bState extends State<Fase6b> {
  List<DropdownMenuItem<String>> listDrop = [];
  String selected = null;

  int cont = 1;
  var caminhoImagem = "images/fase6/esquistossomose.jpg";

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
        caminhoImagem = "images/fase6/giardiase.jpg";
      } else if (cont == 3) {
        caminhoImagem = "images/fase6/oxiuriaseOuEnterobiase.jpg";
      } else if (cont == 1) {
        caminhoImagem = "images/fase6/esquistossomose.jpg";
      }
    });
  }

  void _alertVoceAcertou() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Parabéns!",
              style: TextStyle(
                  color: Colors.lightGreen,
                  fontSize: 25.0,
                  fontFamily: "SnigletRegular")),
          content: new Text("Você acertou, vamos para o próximo desafio.",
              style: TextStyle(
                  color: Colors.lightGreen,
                  fontSize: 20.0,
                  fontFamily: "SnigletRegular")),
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
              label: Text(
                'Fechar',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontFamily: "SnigletRegular"),
              ),
            ),
          ],
        );
      },
    );
  }

  void _alertVoceErrou() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Não foi dessa vez!",
              style: TextStyle(
                  color: Colors.lightGreen,
                  fontSize: 25.0,
                  fontFamily: "SnigletRegular")),
          content: new Text("Você errou, vamos tentar mais uma vez.",
              style: TextStyle(
                  color: Colors.lightGreen,
                  fontSize: 20.0,
                  fontFamily: "SnigletRegular")),
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
              label: Text(
                'Fechar',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
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
        .push(MaterialPageRoute(builder: (context) => Fase7()));
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
        title: Text(
          "BioIntegrada",
          style: TextStyle(
              color: Colors.white,
              fontSize: _maxValue(size.width * 0.07, 25),
              fontFamily: "PoetsenOne"),
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
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  child: Text(
                    "Fase 6",
                    style: TextStyle(
                        color: Colors.lightGreen,
                        fontSize: _maxValue(size.width * 0.085, 31),
                        fontFamily: "PoetsenOne"),
                  ),
                ),
              ],
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  child: Text(
                    "Analise as imagens e classifique a qual ciclo de ",
                    style: TextStyle(
                        color: Colors.lightGreen,
                        fontSize: _maxValue(size.width * 0.043, 16),
                        fontFamily: "SnigletRegular"),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  child: Text(
                    "verminose está relacionada.",
                    style: TextStyle(
                        color: Colors.lightGreen,
                        fontSize: _maxValue(size.width * 0.043, 16),
                        fontFamily: "SnigletRegular"),
                  ),
                ),
              ],
            ),
          
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 337.44,
                maxWidth: 342,
              ),
              child: Container(
                child: Image.asset(caminhoImagem,
                    fit: BoxFit.cover,
                    height: size.height * 0.57,
                    width: size.width * 0.95),
              ),
            ),
              ],
            ), 
          
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DropdownButton(
              items: listDrop,
              value: selected,
              iconSize: _maxValue(size.width * 0.045, 19),
              elevation: 16,
              hint: Text(
                "Selecione uma opção",
                style: TextStyle(fontSize: _maxValue(size.width * 0.045, 16.2)),
              ),
              onChanged: (value) {
                selected = value;
                setState(() {});
              },
            ),
              ],
            ), 
          
          Row(
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
                    child: Text(
                      "RETORNAR",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: _maxValue(size.width * 0.055, 19.8),
                          fontFamily: "SnigletRegular"),
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
                        if (selected == "esquistossomose") {
                          cont++;
                          _alertVoceAcertou();
                          _trocarImagem();
                        } else {
                          _alertVoceErrou();
                        }
                      } else if (cont == 2) {
                        if (selected == "giardiase") {
                          cont++;
                          _alertVoceAcertou();
                          _trocarImagem();
                        } else {
                          _alertVoceErrou();
                        }
                      } else if (cont == 3) {
                        if (selected == "oxiuriaseOuEnterobiase") {
                          cont = 1;
                          _alertVoceAcertou();
                          _trocarImagem();
                          carregar();
                        } else {
                          _alertVoceErrou();
                        }
                      }
                    },
                    child: Text(
                      "  AVANÇAR  ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: _maxValue(size.width * 0.055, 19.8),
                          fontFamily: "SnigletRegular"),
                    ),
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
