import 'package:biointegrada/main.dart';
import 'package:biointegrada/pages/fase8WebView.dart';
import 'package:biointegrada/pages/referenciaImagens.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Fase8 extends StatefulWidget {
  @override
  _Fase8State createState() => _Fase8State();
}

class _Fase8State extends State<Fase8> {
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
                    "Fase 8",
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
            padding: EdgeInsets.only(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  child: Text(
                    "Para finalizar preencha ao questionário, ",
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
                ClipRRect(
                  child: Text(
                    "marcando uma ou mais opções.",
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
            padding: EdgeInsets.only(top: size.height * 0.25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  color: Colors.lightGreen,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  onPressed: () {
                    Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Fase8WebView()));
                  },
                  child: Text(
                    "RESPONDER QUESTIONÁRIO",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: _maxValue(size.width * 0.06, 21.59),
                        fontFamily: "SnigletRegular"),
                  ),
                  textColor: Colors.white,
                ),
              ],
            ), 
          ),

          Padding(
            padding: EdgeInsets.only(top: size.height * 0.25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[OutlineButton(
              color: Colors.lightGreen,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Referencias()));
              },
              child: Text(
                "REFERÊNCIAS DAS IMAGENS",
                style: TextStyle(
                    color: Colors.lightGreen,
                    fontSize: _maxValue(size.width * 0.042, 16),
                    fontFamily: "SnigletRegular"),
              ),
            ),],
            ), 
          ),
        ],
      ),
    );
  }
}
