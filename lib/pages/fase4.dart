import 'dart:async';

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
      child: new Text("Sistema Urinário"),
      value: "sistemaUrinario",
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
      }else if (cont == 4) {
        caminhoImagem = "images/fase4/sistemaEndocrino.jpeg";
      }else if (cont == 5) {
        caminhoImagem = "images/fase4/sistemaExcretor.jpg";
      } else if (cont == 6) {
        caminhoImagem = "images/fase4/sistemaLinfatico.png";
      } else if (cont == 7) {
        caminhoImagem = "images/fase4/sistemaMuscular.jpg";
      } else if (cont == 8) {
        caminhoImagem = "images/fase4/sistemaNervoso.jpeg";
      } else if (cont == 9) {
        caminhoImagem = "images/fase4/sistemaRespiratorio.jpeg";
      }else if (cont == 10) {
        caminhoImagem = "images/fase4/sistemaUrinario.jpeg";
      }else if (cont == 11) {
        caminhoImagem = "images/fase4/sistemaImunologico.png";
      }else if (cont == 1) {
        caminhoImagem = "images/fase4/esqueletico.jpeg";
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
            padding: EdgeInsets.only(top: size.height * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  child: Text(
                    "Fase 4",
                    style: TextStyle(
                        color: Colors.lightGreen,
                        fontSize: _maxValue(size.width * 0.09, 33),
                        fontFamily: "PoetsenOne"),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: size.height * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
              child: Text(
                "Analise as imagens e escolha a opção que ",
                style: TextStyle(
                    color: Colors.lightGreen,
                    fontSize: _maxValue(size.width * 0.043, 16),
                    fontFamily: "SnigletRegular"),
              ),
            ),
              ],
            ), 
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
              child: Text(
                "corresponde a seu respectivo sistema.",
                style: TextStyle(
                    color: Colors.lightGreen,
                    fontSize: _maxValue(size.width * 0.043, 16),
                    fontFamily: "SnigletRegular"),
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
              hint: Text(
                "Selecione uma opção",
                style: TextStyle(fontSize: _maxValue(size.width * 0.05, 19)),
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
            child:Row(
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
                        fontSize: _maxValue(size.width * 0.06, 21.59),
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
                      if (selected == "sistemaEsqueletico") {
                        cont++;
                        _alertVoceAcertou();
                        _trocarImagem();
                      } else {
                        _alertVoceErrou();
                      }
                    } else if (cont == 2) {
                      if (selected == "sistemaCardiovascular") {
                        cont++;
                        _alertVoceAcertou();
                        _trocarImagem();
                      } else {
                        _alertVoceErrou();
                      }
                    } else if (cont == 3) {
                      if (selected == "sistemaDigestorio") {
                        cont++;
                        _alertVoceAcertou();
                        _trocarImagem();
                      } else {
                        _alertVoceErrou();
                      }
                    } else if (cont == 4) {
                      if (selected == "sistemaEndocrino") {
                        cont++;
                        _alertVoceAcertou();
                        _trocarImagem();
                      } else {
                        _alertVoceErrou();
                      }
                    } else if (cont == 5) {
                      if (selected == "sistemaExcretor") {
                        cont++;
                        _alertVoceAcertou();
                        _trocarImagem();
                      } else {
                        _alertVoceErrou();
                      }
                    } else if (cont == 6) {
                      if (selected == "sistemaLinfatico") {
                        cont++;
                        _alertVoceAcertou();
                        _trocarImagem();
                      } else {
                        _alertVoceErrou();
                      }
                    } else if (cont == 7) {
                      if (selected == "sistemaMuscular") {
                        cont++;
                        _alertVoceAcertou();
                        _trocarImagem();
                      } else {
                        _alertVoceErrou();
                      }
                    }else if (cont == 8) {
                      if (selected == "sistemaNervoso") {
                        cont++;
                        _alertVoceAcertou();
                        _trocarImagem();
                      } else {
                        _alertVoceErrou();
                      }
                    }else if (cont == 9) {
                      if (selected == "sistemaRespiratorio") {
                        cont++;
                        _alertVoceAcertou();
                        _trocarImagem();
                      } else {
                        _alertVoceErrou();
                      }
                    }else if (cont == 10) {
                      if (selected == "sistemaUrinario") {
                        cont++;
                        _alertVoceAcertou();
                        _trocarImagem();
                      } else {
                        _alertVoceErrou();
                      }
                    }else if (cont == 11) {
                      if (selected == "sistemaImunologico") {
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
                        fontSize: _maxValue(size.width * 0.06, 21.59),
                        fontFamily: "SnigletRegular"),
                  ),
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
          ),
          
        ],
      ),
    );
  }
}