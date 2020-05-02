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
      child: new Text("Eucariótica"),
      value: "eucariotica",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Procariótica"),
      value: "procariotica",
    ));
  }

  void loadData2() {
    listDrop2 = [];
    listDrop2.add(new DropdownMenuItem(
      child: new Text("Eucariótica"),
      value: "eucariotica",
    ));

    listDrop2.add(new DropdownMenuItem(
      child: new Text("Procariótica"),
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
          child: Text(
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
      body: Column(
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
                    maxWidth: _maxValue(size.width * 0.95, 350),
                    maxHeight: _maxValue(size.height * 0.35, 20),
                  ),
                  child: AutoSizeText(
                    "Selecione o nome que corresponde a cada célula.",
                    style: TextStyle(
                        color: Colors.lightGreen,
                        fontSize: _maxValue(size.width * 0.0439, 16),
                        fontFamily: "SnigletRegular"),
                    maxLines: 1,
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
                    hint: Text(
                      "Selecione uma opção",
                      style: TextStyle(
                          fontSize: _maxValue(size.width * 0.04, 14.4)),
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
                    hint: Text(
                      "Selecione uma opção",
                      style: TextStyle(
                          fontSize: _maxValue(size.width * 0.04, 14.4)),
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
                        _alertVoceAcertou();
                        carregar();
                      } else {
                        _alertVoceErrou();
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
    );
  }
}
