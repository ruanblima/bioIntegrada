import 'dart:async';

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
  var caminhoImagem = "images/fase3/tecidoDoIntestinoGrosso.jpg";

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
      value: "estomago",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Figura 4"),
      value: "figado",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Figura 5"),
      value: "intestinoFino",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Figura 6"),
      value: "intestinoGrosso",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Figura 7"),
      value: "osso",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Figura 8"),
      value: "pele",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Figura 9"),
      value: "pulmao",
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text("Figura 10"),
      value: "rins",
    ));
  }

  void _trocarImagem() {
    setState(() {
      if (cont == 2) {
        caminhoImagem = "images/fase3/tecidoDoFigado.jpg";
      } else if (cont == 3) {
        caminhoImagem = "images/fase3/tecidoDosRins.jpg";
      } else if (cont == 4) {
        caminhoImagem = "images/fase3/tecidoDoEstomago.jpg";
      } else if (cont == 5) {
        caminhoImagem = "images/fase3/tecidoDoPulmao.jpg";
      } else if (cont == 6) {
        caminhoImagem = "images/fase3/tecidoDaPele.jpg";
      } else if (cont == 7) {
        caminhoImagem = "images/fase3/tecidoDoCoracao.jpg";
      } else if (cont == 8) {
        caminhoImagem = "images/fase3/tecidoDoIntestinoFino.png";
      } else if (cont == 9) {
        caminhoImagem = "images/fase3/tecidoDoOsso.jpg";
      } else if (cont == 10) {
        caminhoImagem = "images/fase3/tecidoDoCerebro.jpg";
      } else if (cont == 1) {
        caminhoImagem = "images/fase3/tecidoDoIntestinoGrosso.jpg";
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
                    "Fase 3",
                    style: TextStyle(
                        color: Colors.lightGreen,
                        fontSize: _maxValue(size.width * 0.09, 33),
                        fontFamily: "PoetsenOne"),
                  ),
                ),
              ],
            ),
          ),
          //Row
          Padding(
            padding: EdgeInsets.only(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  child: Text(
                    "Relacione a imagem do tecido com o seu orgão.",
                    style: TextStyle(
                        color: Colors.lightGreen,
                        fontSize: _maxValue(size.width * 0.043, 16),
                        fontFamily: "SnigletRegular"),
                  ),
                ),
              ],
            ),
          ),
          //Row
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(),
                  child: ClipRRect(
                    child: Text(
                      "Figura 1",
                      style: TextStyle(
                          color: Colors.lightGreen,
                          fontSize: _maxValue(size.width * 0.04, 14.4),
                          fontFamily: "PoetsenOne"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.07),
                  child: ClipRRect(
                    child: Text(
                      "Figura 2",
                      style: TextStyle(
                          color: Colors.lightGreen,
                          fontSize: _maxValue(size.width * 0.04, 14.4),
                          fontFamily: "PoetsenOne"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.04),
                  child: ClipRRect(
                    child: Text(
                      "Figura 3",
                      style: TextStyle(
                          color: Colors.lightGreen,
                          fontSize: _maxValue(size.width * 0.04, 14.4),
                          fontFamily: "PoetsenOne"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.05),
                  child: ClipRRect(
                    child: Text(
                      "Figura 4",
                      style: TextStyle(
                          color: Colors.lightGreen,
                          fontSize: _maxValue(size.width * 0.04, 14.4),
                          fontFamily: "PoetsenOne"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.05),
                  child: ClipRRect(
                    child: Text(
                      "Figura 5",
                      style: TextStyle(
                          color: Colors.lightGreen,
                          fontSize: _maxValue(size.width * 0.04, 14.4),
                          fontFamily: "PoetsenOne"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Row
          Padding(
            padding: EdgeInsets.only(),
            child: Row(
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
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.014),
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
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.018),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 47.36,
                      maxWidth: 64.8,
                    ),
                    child: Container(
                      child: Image.asset("images/fase3/estomago.jpg",
                          fit: BoxFit.cover,
                          height: size.height * 0.08,
                          width: size.width * 0.18),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.018),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 47.36,
                      maxWidth: 64.8,
                    ),
                    child: Container(
                      child: Image.asset("images/fase3/figado.jpg",
                          fit: BoxFit.cover,
                          height: size.height * 0.08,
                          width: size.width * 0.18),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.018),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 47.36,
                      maxWidth: 64.8,
                    ),
                    child: Container(
                      child: Image.asset("images/fase3/intestinoFino.jpg",
                          fit: BoxFit.cover,
                          height: size.height * 0.08,
                          width: size.width * 0.18),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Row
          Padding(
            padding: EdgeInsets.only(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(),
                  child: ClipRRect(
                    child: Text(
                      "Figura 6",
                      style: TextStyle(
                          color: Colors.lightGreen,
                          fontSize: _maxValue(size.width * 0.04, 14.4),
                          fontFamily: "PoetsenOne"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.05),
                  child: ClipRRect(
                    child: Text(
                      "Figura 7",
                      style: TextStyle(
                          color: Colors.lightGreen,
                          fontSize: _maxValue(size.width * 0.04, 14.4),
                          fontFamily: "PoetsenOne"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.05),
                  child: ClipRRect(
                    child: Text(
                      "Figura 8",
                      style: TextStyle(
                          color: Colors.lightGreen,
                          fontSize: _maxValue(size.width * 0.04, 14.4),
                          fontFamily: "PoetsenOne"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.05),
                  child: ClipRRect(
                    child: Text(
                      "Figura 9",
                      style: TextStyle(
                          color: Colors.lightGreen,
                          fontSize: _maxValue(size.width * 0.04, 14.4),
                          fontFamily: "PoetsenOne"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.05),
                  child: ClipRRect(
                    child: Text(
                      "Figura 10",
                      style: TextStyle(
                          color: Colors.lightGreen,
                          fontSize: _maxValue(size.width * 0.04, 14.4),
                          fontFamily: "PoetsenOne"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Row
          Padding(
            padding: EdgeInsets.only(),
            child: Row(
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
                      child: Image.asset("images/fase3/intestinoGrosso.jpg",
                          fit: BoxFit.cover,
                          height: size.height * 0.08,
                          width: size.width * 0.18),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.015),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 71.03,
                      maxWidth: 64.8,
                    ),
                    child: Container(
                      child: Image.asset("images/fase3/osso.jpg",
                          fit: BoxFit.cover,
                          height: size.height * 0.12,
                          width: size.width * 0.18),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.015),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 71.03,
                      maxWidth: 64.8,
                    ),
                    child: Container(
                      child: Image.asset("images/fase3/pele.jpg",
                          fit: BoxFit.cover,
                          height: size.height * 0.12,
                          width: size.width * 0.18),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.015),
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
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.015),
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
          ),
          //Row
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.02),
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
            padding: EdgeInsets.only(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DropdownButton(
                  items: listDrop,
                  value: selected,
                  iconSize: _maxValue(size.width * 0.05, 19),
                  elevation: 16,
                  hint: Text(
                    "Selecione uma opção",
                    style: TextStyle(fontSize: _maxValue(size.width * 0.05, 18)),
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
            padding: EdgeInsets.only(),
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
                        if (selected == "intestinoGrosso") {
                          cont++;
                          _alertVoceAcertou();
                          _trocarImagem();
                        } else {
                          _alertVoceErrou();
                        }
                      } else if (cont == 2) {
                        if (selected == "figado") {
                          cont++;
                          _alertVoceAcertou();
                          _trocarImagem();
                        } else {
                          _alertVoceErrou();
                        }
                      } else if (cont == 3) {
                        if (selected == "rins") {
                          cont++;
                          _alertVoceAcertou();
                          _trocarImagem();
                        } else {
                          _alertVoceErrou();
                        }
                      } else if (cont == 4) {
                        if (selected == "estomago") {
                          cont++;
                          _alertVoceAcertou();
                          _trocarImagem();
                        } else {
                          _alertVoceErrou();
                        }
                      } else if (cont == 5) {
                        if (selected == "pulmao") {
                          cont++;
                          _alertVoceAcertou();
                          _trocarImagem();
                        } else {
                          _alertVoceErrou();
                        }
                      } else if (cont == 6) {
                        if (selected == "pele") {
                          cont++;
                          _alertVoceAcertou();
                          _trocarImagem();
                        } else {
                          _alertVoceErrou();
                        }
                      } else if (cont == 7) {
                        if (selected == "coracao") {
                          cont++;
                          _alertVoceAcertou();
                          _trocarImagem();
                        } else {
                          _alertVoceErrou();
                        }
                      } else if (cont == 8) {
                        if (selected == "intestinoFino") {
                          cont++;
                          _alertVoceAcertou();
                          _trocarImagem();
                        } else {
                          _alertVoceErrou();
                        }
                      } else if (cont == 9) {
                        if (selected == "osso") {
                          cont++;
                          _alertVoceAcertou();
                          _trocarImagem();
                        } else {
                          _alertVoceErrou();
                        }
                      } else if (cont == 10) {
                        if (selected == "cerebro") {
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
