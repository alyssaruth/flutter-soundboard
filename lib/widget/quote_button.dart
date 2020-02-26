import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocket_scat/util/quote.dart';

class QuoteButton extends StatelessWidget {
  final Quote _quote;

  QuoteButton(this._quote);

  @override
  Widget build(BuildContext context) => GestureDetector(
      onLongPress: () {
        _quote.shareAudio(context);
      },
      child: CupertinoButton(
        child: Stack(children: <Widget>[
          Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: new DecorationImage(image: _quote.getImage()),
                borderRadius: BorderRadius.circular(12),
              )),
          _buildTextOverlay(context)
        ]),
        onPressed: () {
          _quote.play();
        },
      ));

  Widget _buildTextOverlay(BuildContext context) => Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.75),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(12),
                bottomLeft: Radius.circular(12))),
        child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Text(
              _quote.name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            )),
      ));
}
