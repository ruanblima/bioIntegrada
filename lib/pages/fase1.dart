import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:biointegrada/main.dart';
import 'package:biointegrada/pages/fase2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Fase1 extends StatefulWidget {
  @override
  _Fase1State createState() => _Fase1State();
}

class _Fase1State extends State<Fase1> {
  List<DropdownMenuItem<String>> listDrop = [];
  List<DropdownMenuItem<String>> listDrop2 = [];

  String selected = null;
  String selected2 = null;

  void loadData() {
    listDrop = [];
    listDrop.add(new DropdownMenuItem(
      child: new AutoSizeText("Eucariótica"),
      value: "eucariotica",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new AutoSizeText("Procariótica"),
      value: "procariotica",
    ));
  }

  void loadData2() {
    listDrop2 = [];
    listDrop2.add(new DropdownMenuItem(
      child: new AutoSizeText("Eucariótica"),
      value: "eucariotica",
    ));

    listDrop2.add(new DropdownMenuItem(
      child: new AutoSizeText("Procariótica"),
      value: "procariotica",
    ));
  }

  onDoneLoading() async {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Fase2()));
  }

  Future<Timer> carregar() async {
    return new Timer(Duration(seconds: 1), onDoneLoading);
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
    loadData2();
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
                      "Fase 1",
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
                      "Selecione o nome que corresponde a cada célula.",
                      style: TextStyle(
                          color: Colors.lightGreen,
                          fontSize: _maxValue(size.width * 0.1739, 25),
                          fontFamily: "SnigletRegular"),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.09),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 98.72,
                        maxWidth: 158.8,
                      ),
                      child: Container(
                        child: Image.asset("images/fase1/eucariotica.png",
                            fit: BoxFit.cover,
                            height: size.height * 0.16,
                            width: size.width * 0.43),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.03),
                    child: DropdownButton(
                      items: listDrop,
                      value: selected,
                      iconSize: _maxValue(size.width * 0.07, 25),
                      elevation: 16,
                      hint: AutoSizeText(
                        "Selecione uma opção",
                        style: TextStyle(
                            fontSize: _maxValue(size.width * 0.02, 8.0)),
                      ),
                      onChanged: (value) {
                        selected = value;
                        setState(() {});
                      },
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
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.07),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 122.4,
                        maxWidth: 158.8,
                      ),
                      child: Container(
                        child: Image.asset("images/fase1/procariotica.png",
                            fit: BoxFit.cover,
                            height: size.height * 0.20,
                            width: size.width * 0.43),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.03, top: size.height * 0.07),
                    child: DropdownButton(
                      items: listDrop2,
                      value: selected2,
                      iconSize: _maxValue(size.width * 0.07, 25),
                      elevation: 16,
                      hint: AutoSizeText(
                        "Selecione uma opção",
                        style: TextStyle(
                            fontSize: _maxValue(size.width * 0.02, 8.0)),
                      ),
                      onChanged: (value) {
                        selected2 = value;
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.11),
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
                    padding: EdgeInsets.only(left: 10.0),
                    child: FlatButton(
                      color: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      onPressed: () {
                        if (selected == "procariotica" &&
                            selected2 == "eucariotica") {
                          _alertVoceAcertou(size);
                          carregar();
                        } else {
                          _alertVoceErrou(size);
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
