import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:biointegrada/main.dart';
import 'package:biointegrada/pages/fase2b.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Fase2 extends StatefulWidget {
  @override
  _Fase2State createState() => _Fase2State();
}

class _Fase2State extends State<Fase2> {
  List<DropdownMenuItem<String>> listDrop = [];
  String selected = null;

  int cont = 1;
  var caminhoImagem = "images/fase2/tecidoConjutivoAdiposo.jpg";

  void loadData() {
    listDrop = [];
    listDrop.add(new DropdownMenuItem(
      child: new Text("Tecidos Epiteliais"),
      value: "tecidosEpiteliais",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Tecido Conjutivo Denso"),
      value: "tecidoConjutivoDenso",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Tecido Conjutivo Frouxo"),
      value: "tecidoConjutivoFrouxo",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Tecido Conjutivo Adiposo"),
      value: "tecidoConjutivoAdiposo",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Tecido Conjutivo Cartilaginoso"),
      value: "tecidoConjutivoCartilaginoso",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Tecido Conjutivo Ósseo"),
      value: "tecidoConjutivoOsseo",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Tecido Conjutivo Hematopoiético"),
      value: "tecidoConjutivoHematopoietico",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Tecidos Musculares"),
      value: "tecidosMusculares",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Tecido Nervoso"),
      value: "tecidoNervoso",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Tecido Epitelial Glandular"),
      value: "tecidoEpitelialGlandular",
    ));
  }

  void _trocarImagem() {
    setState(() {
      if (cont == 2) {
        caminhoImagem = "images/fase2/tecidoConjutivoCartilaginoso.jpg";
      } else if (cont == 3) {
        caminhoImagem = "images/fase2/tecidoConjutivoDenso.png";
      } else if (cont == 4) {
        caminhoImagem = "images/fase2/tecidoConjutivoFrouxo.jpg";
      } else if (cont == 5) {
        caminhoImagem = "images/fase2/tecidoConjutivoHematopoietico.jpg";
      } else if (cont == 6) {
        caminhoImagem = "images/fase2/tecidoConjutivoOsseo.jpg";
      } else if (cont == 7) {
        caminhoImagem = "images/fase2/tecidoEpitelialGlandular.jpg";
      } else if (cont == 8) {
        caminhoImagem = "images/fase2/tecidoNervoso.jpg";
      } else if (cont == 1) {
        caminhoImagem = "images/fase2/tecidoConjutivoAdiposo.jpg";
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
        .push(MaterialPageRoute(builder: (context) => Fase2b()));
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
        title: FittedBox(
          fit: BoxFit.fitWidth,
          child: AutoSizeText(
            "BioIntegrada",
            style: TextStyle(color: Colors.white, fontFamily: "PoetsenOne"),
          ),
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
                      "Fase 2",
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
              padding: EdgeInsets.only(top: size.height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: size.width,
                      //maxHeight: _maxValue(size.height * 0.30, 200),
                    ),
                    child: AutoSizeText(
                      "Em cada imagem dos tecidos histológicos, escolha a opção que classifica corretamente o tipo de tecido representado.",
                      style: TextStyle(
                          color: Colors.lightGreen,
                          fontSize: _maxValue(size.width * 0.1739, 25),
                          fontFamily: "SnigletRegular"),
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 207.2,
                      maxWidth: 352.8,
                    ),
                    child: Container(
                      child: Image.asset(caminhoImagem,
                          fit: BoxFit.cover,
                          height: size.height * 0.35,
                          width: size.width * 0.98),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.04),
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
                          if (selected == "tecidoConjutivoAdiposo") {
                            cont++;
                            _alertVoceAcertou(size);
                            _trocarImagem();
                          } else {
                            _alertVoceErrou(size);
                          }
                        } else if (cont == 2) {
                          if (selected == "tecidoConjutivoCartilaginoso") {
                            cont++;
                            _alertVoceAcertou(size);
                            _trocarImagem();
                          } else {
                            _alertVoceErrou(size);
                          }
                        } else if (cont == 3) {
                          if (selected == "tecidoConjutivoDenso") {
                            cont++;
                            _alertVoceAcertou(size);
                            _trocarImagem();
                          } else {
                            _alertVoceErrou(size);
                          }
                        } else if (cont == 4) {
                          if (selected == "tecidoConjutivoFrouxo") {
                            cont++;
                            _alertVoceAcertou(size);
                            _trocarImagem();
                          } else {
                            _alertVoceErrou(size);
                          }
                        } else if (cont == 5) {
                          if (selected == "tecidoConjutivoHematopoietico") {
                            cont++;
                            _alertVoceAcertou(size);
                            _trocarImagem();
                          } else {
                            _alertVoceErrou(size);
                          }
                        } else if (cont == 6) {
                          if (selected == "tecidoConjutivoOsseo") {
                            cont++;
                            _alertVoceAcertou(size);
                            _trocarImagem();
                          } else {
                            _alertVoceErrou(size);
                          }
                        } else if (cont == 7) {
                          if (selected == "tecidoEpitelialGlandular") {
                            cont++;
                            _alertVoceAcertou(size);
                            _trocarImagem();
                          } else {
                            _alertVoceErrou(size);
                          }
                        } else if (cont == 8) {
                          if (selected == "tecidoNervoso") {
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
