import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:biointegrada/main.dart';
import 'package:biointegrada/pages/fase5b.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Fase5 extends StatefulWidget {
  @override
  _Fase5State createState() => _Fase5State();
}

class _Fase5State extends State<Fase5> {
  var caminhoImagem = "images/fase5/homemCerto.png";
  var caminhoImagem2 = "images/fase5/homemErrado.png";

  String resposta = "";
  int selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
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
        .push(MaterialPageRoute(builder: (context) => Fase5b()));
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
                      "Fase 5",
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
                  "Marque a imagem que representa corretamente a localização dos órgãos no corpo masculino.",
                  style: TextStyle(
                      color: Colors.lightGreen,
                      fontSize: _maxValue(size.width * 0.0439, 16),
                      fontFamily: "SnigletRegular"),
                  maxLines: 2,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.06),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 248.64,
                        maxWidth: 169.2,
                      ),
                      child: Container(
                        child: Image.asset(caminhoImagem,
                            fit: BoxFit.cover,
                            height: size.height * 0.42,
                            width: size.width * 0.47),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.03),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 248.64,
                        maxWidth: 169.2,
                      ),
                      child: Container(
                        child: Image.asset(caminhoImagem2,
                            fit: BoxFit.cover,
                            height: size.height * 0.42,
                            width: size.width * 0.47),
                      ),
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
                  Radio(
                    value: 1,
                    activeColor: Colors.lightGreen,
                    groupValue: selectedRadio,
                    onChanged: (val) {
                      resposta = "homemCerto";
                      setSelectedRadio(val);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.36),
                    child: Radio(
                      value: 2,
                      activeColor: Colors.lightGreen,
                      groupValue: selectedRadio,
                      onChanged: (val) {
                        resposta = "homemErrado";
                        setSelectedRadio(val);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.03),
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
                        if (resposta == "homemCerto") {
                          _alertVoceAcertou(size);
                          selectedRadio = 0;
                          resposta = "";
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
