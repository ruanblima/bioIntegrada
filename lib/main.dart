import 'package:biointegrada/pages/fase1.dart';
import 'package:biointegrada/pages/sobreAppWebView.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:biointegrada/pages/sequenciaDidatica.dart';

void main() {
  runApp(MaterialApp(
    title: "BioIntegrada",
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: size.height * 0.09),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: _maxValue(size.height * 0.73, 260),
                          maxWidth: _maxValue(size.width * 0.73, 260)),
                      child: AutoSizeText(
                        "Seja Bem Vindo",
                        style: TextStyle(
                            color: Colors.lightGreen,
                            fontSize: 40.0,
                            fontFamily: "SnigletRegular"),
                        maxLines: 1,
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
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      maxRadius: _maxValue(size.width * 0.42, 150),
                      child: Image.asset(
                        "images/bioIntegrada.png",
                        fit: BoxFit.cover,
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
                          maxHeight: _maxValue(size.height * 0.73, 260),
                          maxWidth: _maxValue(size.width * 0.73, 260)),
                      child: AutoSizeText(
                        "BioIntegrada",
                        style: TextStyle(
                            color: Colors.lightGreen,
                            fontSize: 40.0,
                            fontFamily: "SnigletRegular"),
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
                    FlatButton.icon(
                      color: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Fase1()));
                      },
                      label: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: _maxValue(size.width * 0.40, 180),
                          maxHeight: _maxValue(size.height * 0.23, 60),
                        ),
                        child: AutoSizeText(
                          " JOGAR",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: _maxValue(size.width * 0.13, 47),
                              fontFamily: "SnigletRegular"),
                          maxLines: 1,
                        ),
                      ),
                      textColor: Colors.white,
                      icon: Icon(
                        FontAwesomeIcons.gamepad,
                        size: _maxValue(size.width * 0.13, 47),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    OutlineButton(
                      color: Colors.lightGreen,
                      borderSide:
                          BorderSide(width: 1.0, color: Colors.lightGreen),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SobreApp()));
                      },
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: _maxValue(size.width * 0.50, 200),
                          maxHeight: _maxValue(size.height * 0.2, 30),
                        ),
                        child: AutoSizeText(
                          "SOBRE O BIOINTEGRADA",
                          style: TextStyle(
                              color: Colors.lightGreen,
                              fontWeight: FontWeight.w300,
                              fontSize: _maxValue(size.width * 0.042, 16),
                              fontFamily: "SnigletRegular"),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    OutlineButton(
                      color: Colors.lightGreen,
                      borderSide:
                          BorderSide(width: 1.0, color: Colors.lightGreen),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SequenciaDidatica()));
                      },
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: _maxValue(size.width * 0.50, 200),
                          maxHeight: _maxValue(size.height * 0.2, 30),
                        ),
                        child: AutoSizeText(
                          "SD",
                          style: TextStyle(
                              color: Colors.lightGreen,
                              fontWeight: FontWeight.w300,
                              fontSize: _maxValue(size.width * 0.042, 16),
                              fontFamily: "SnigletRegular"),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
