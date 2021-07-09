import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memorize_flutter/card.model.dart';
import 'package:memorize_flutter/cards.notifier.dart';
import 'package:provider/provider.dart';

class CardView extends StatelessWidget {
  CardView(
      {Key? key,
      required EmojiCard card,
      required double width,
      required double height,
      required int numberOfCards})
      : this._card = card,
        this._deviceWidth = width,
        this._deviceHeight = height,
        this._numberOfCards = numberOfCards,
        super(key: key);

  late final EmojiCard _card;
  late final double _deviceWidth;
  late final double _deviceHeight;
  late final int _numberOfCards;

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<MyCards>(context);
    final paddingValueLR = _deviceWidth * 5 / 100;
    final paddingValueTB = _deviceHeight * 5 / 100;
    final int cardCountRow = sqrt(_numberOfCards).floor();
    final int cardCountColumn = sqrt(_numberOfCards).ceil();

    Color color;
    String content;

    if (_card.isFaceUp) {
      color = Colors.white;
      content = _card.content;
    } else {
      color = Colors.redAccent;
      content = "";
    }

    if (_card.isMatched) {
      color = Colors.transparent;
      content = "";
    }

    return GestureDetector(
      onTap: () => state.choose(card: _card),
      child: Padding(
        padding: EdgeInsets.only(
            left: paddingValueLR,
            right: paddingValueLR,
            bottom: paddingValueTB,
            top: paddingValueTB),
        child: Container(
          color: color,
          alignment: Alignment.center,
          width: (_deviceWidth * 80 / 100 / cardCountRow) / 2,
          height: (_deviceHeight * 80 / 100 / cardCountColumn) / 2,
          child: Text(content,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.longestSide * 2 / 100)),
        ),
      ),
    );
  }
}
