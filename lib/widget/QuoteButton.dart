import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocket_scat/util/Quote.dart';

class QuoteButton extends StatelessWidget {
  final Quote _quote;

  QuoteButton(this._quote);

  @override
  Widget build(BuildContext context) => GestureDetector(
      onLongPress: () {
        _quote.share(context);
      },
      child: CupertinoButton(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            image: new DecorationImage(image: _quote.getImage()),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.fromLTRB(0, 140, 0, 0),
            width: 200,
            height: 40,
            decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.75),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12))),
            child: Container(
                margin: EdgeInsets.fromLTRB(5, 0, 5, 8),
                child: Text(
                  _quote.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                )),
          ),
        ),
        onPressed: () {
          _quote.play();
        },
      ));
}
