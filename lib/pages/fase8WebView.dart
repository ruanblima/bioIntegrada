import 'dart:async';
import 'package:biointegrada/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Fase8WebView extends StatefulWidget {
  @override
  _Fase8WebViewState createState() => _Fase8WebViewState();
}

class _Fase8WebViewState extends State<Fase8WebView> {
  @override
  void initState() {
    super.initState();
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
    //Teste
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
      body: const WebView(
        initialUrl:
            'https://docs.google.com/forms/d/e/1FAIpQLSdSNQ1tBaktguml27XhrXo8VdrauxhVJn5hDuq-V2lLXFSjXg/viewform?usp=sf_link',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
