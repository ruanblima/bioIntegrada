import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:biointegrada/main.dart';
import 'package:biointegrada/pages/fase2c.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Fase2b extends StatefulWidget {
  @override
  _Fase2bState createState() => _Fase2bState();
}

class _Fase2bState extends State<Fase2b> {
  List<DropdownMenuItem<String>> listDrop = [];
  String selected = null;

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
        .push(MaterialPageRoute(builder: (context) => Fase2c()));
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
              padding: EdgeInsets.all(5),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: size.width,
                  //maxHeight: _maxValue(size.height * 0.30, 200),
                ),
                child: AutoSizeText(
                  "Em cada imagem dos tecidos histológicos, escolha a opção que classifica corretamente o tipo de tecido representado.",
                  style: TextStyle(
                      color: Colors.lightGreen,
                      fontSize: _maxValue(size.width * 0.0439, 16),
                      fontFamily: "SnigletRegular"),
                  maxLines: 3,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 112.48,
                        maxWidth: 169.2,
                      ),
                      child: Container(
                        child: Image.asset("images/fase2/tecidoMuscular1.png",
                            fit: BoxFit.cover,
                            height: size.height * 0.19,
                            width: size.width * 0.47),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.02),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 112.48,
                        maxWidth: 169.2,
                      ),
                      child: Container(
                        child: Image.asset("images/fase2/tecidoMuscular2.png",
                            fit: BoxFit.cover,
                            height: size.height * 0.19,
                            width: size.width * 0.47),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.025),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 112.48,
                      maxWidth: 169.2,
                    ),
                    child: Container(
                      child: Image.asset("images/fase2/tecidoMuscular3.png",
                          fit: BoxFit.cover,
                          height: size.height * 0.19,
                          width: size.width * 0.47),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.025),
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
              padding: EdgeInsets.only(top: size.height * 0.025),
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
                        if (selected == "tecidosMusculares") {
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
