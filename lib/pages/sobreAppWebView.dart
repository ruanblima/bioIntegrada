import 'package:auto_size_text/auto_size_text.dart';
import 'package:biointegrada/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SobreApp extends StatefulWidget {
  @override
  _SobreAppState createState() => _SobreAppState();
}

class _SobreAppState extends State<SobreApp> {
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
      body: const WebView(
        initialUrl:
            'https://drive.google.com/file/d/1o6Ex2Sdo_8QzU08b7nCXPqZC35yZeeog/view?usp=sharing',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
