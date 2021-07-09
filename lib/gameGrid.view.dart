import 'package:flutter/material.dart';
import 'package:memorize_flutter/card.view.dart';
import 'package:memorize_flutter/cards.notifier.dart';
import 'package:provider/provider.dart';

class GameGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyCards>(
      builder: (context, state, _) => Scaffold(
        appBar: PreferredSize(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text('Score: ' + state.score.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.longestSide *
                              4 /
                              100)),
                ),
              ),
            ),
          ),
          preferredSize: const Size(double.infinity, kToolbarHeight),
        ),
        body: Center(
          child: (state.isGameEnded)
              ? ElevatedButton(
                  onPressed: () => state.restart(),
                  child: Text("Start a new game!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.longestSide *
                              3 /
                              100)),
                )
              : Wrap(
                  direction: Axis.vertical,
                  children: [
                    for (var card in state.cards)
                      CardView(
                          card: card,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          numberOfCards: state.cards.length),
                  ],
                ),
        ),
      ),
    );
  }
}
